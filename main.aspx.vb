Imports System.Data.OleDb
Imports System.Web
Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Partial Class project_main
    Inherits System.Web.UI.Page

    'Dim UserName = Session("Username")

    'Dim lunchcal As Decimal = Convert.ToDecimal(Request.QueryString("totcal"))
    '    TextBox1.Text &= lunchcal

    Private Shared con As New SqlConnection("Data Source = cb-ot-devst06.ad.wsu.edu; initial catalog = MF21zhiyuan.chen2; Persist Security Info = True;User ID=zhiyuan.chen2 ;Password=0ef7143e ")
    Protected Sub LinkButton1_Click(sender As Object, e As EventArgs) Handles LinkButton1.Click
        MultiView1.ActiveViewIndex = 0
        Dim Username = Request.QueryString("Username")



    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'query the value from the login page
        Dim UserID = Request.QueryString("UserID")
        Dim dt As New DataTable
        Dim ID As New SqlDataAdapter("select Username From projectUSer where UserID = @p2", con)
        With ID.SelectCommand.Parameters
            .Clear()
            .AddWithValue("p2", UserID)
        End With
        ID.Fill(dt)
        Dim Username As String = Convert.ToString(dt.Rows(0).Item(0))
        'print out the user name
        Label1.Text = "login as " + Username
        LinkButton4.Visible = False
        LinkButton5.Visible = False
        ddlgoal.Visible = False
        'if user already has set goal, diplay update goal instead Goal setting
        Dim decAnswer As Decimal
        Dim cmdCheckEntry As New SqlCommand("select Current_BMI From projectUserinfo Where UserID = @p1", con)

        With cmdCheckEntry.Parameters
            .Clear()

            .AddWithValue("@p1", UserID)


        End With

        Try
            If con.State = ConnectionState.Closed Then con.Open()
            decAnswer = cmdCheckEntry.ExecuteScalar
        Catch ex As Exception
            Response.Write(ex.Message)

        Finally
            con.Close()
        End Try

        If decAnswer > 1 Then
            Goal.Text = "Update My goal"

        Else
            Goal.Text = "Setup my goal"
            LinkButton3.Visible = False
        End If








    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles Goal.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub txtcal_TextChanged(sender As Object, e As EventArgs) Handles txtcal.TextChanged

    End Sub

    Protected Sub insert_Click(sender As Object, e As EventArgs) Handles insert.Click
        'insert food record to DB
        Dim UserID = Request.QueryString("UserID")
        Dim insertfood As New SqlCommand("insert into projectGrocery Values(@p1,@p2,@p3,@p4,@p5)", con)

        With insertfood.Parameters
            .Clear()
            .AddWithValue("@p1", UserID)
            .AddWithValue("@p2", txtitem.Text)
            .AddWithValue("@p3", Convert.ToDecimal(txtqty.Text))
            .AddWithValue("@p4", txtcal.Text)
            .AddWithValue("@p5", ddlType.SelectedValue)



        End With

        Try
            If con.State = ConnectionState.Closed Then con.Open()
            insertfood.ExecuteNonQuery()
        Catch ex As Exception
            Response.Write(ex.Message)

        Finally
            con.Close()
        End Try
        gdvGrocery.DataBind()
    End Sub

    Protected Sub LinkButton3_Click(sender As Object, e As EventArgs) Handles LinkButton3.Click
        MultiView1.ActiveViewIndex = 2
        MultiView2.ActiveViewIndex = 0
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        MultiView1.ActiveViewIndex = 2
        MultiView2.ActiveViewIndex = 0
        LinkButton3.Visible = True
    End Sub

    Protected Sub Delete_Click(sender As Object, e As EventArgs) Handles Delete.Click
        'delete row base on select row
        Dim UserID = Request.QueryString("UserID")

        Using cmd As New SqlCommand("Delete From projectGrocery where ItemName = @p1 and UserID = @p2 ", con)
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@p1", ddldelteitem.SelectedValue)
            cmd.Parameters.AddWithValue("@p2", UserID)
            con.Open()
            Dim rowsAffected = cmd.ExecuteNonQuery()
            con.Close()

        End Using
        gdvGrocery.DataBind()
    End Sub

    Protected Sub gdvGrocery_SelectedIndexChanged(sender As Object, e As EventArgs) Handles gdvGrocery.SelectedIndexChanged

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Dim UserID = Request.QueryString("UserID")
        Dim Bmr, target_BMI, Current_BMI, SuggestBMR As Decimal


        If rdlsex.SelectedValue = 0 Then
            Bmr = 88.362 + (13.397 * Convert.ToDecimal(txtweight.Text)) + (4.799 * Convert.ToDecimal(txtheight.Text)) - (6.677 * Convert.ToDecimal(txtage.Text))
        ElseIf rdlsex.SelectedValue = 1 Then
            Bmr = 447.593 + (9.274 * Convert.ToDecimal(txtweight.Text)) + (3.098 * Convert.ToDecimal(txtheight.Text)) - (4.33 * Convert.ToDecimal(txtage.Text))
        End If

        target_BMI = Convert.ToDecimal(txtarw.Text) / ((Convert.ToDecimal(txtheight.Text) / 100) * (Convert.ToDecimal(txtheight.Text) / 100))
        Current_BMI = Convert.ToDecimal(txtweight.Text) / ((Convert.ToDecimal(txtheight.Text) / 100) * (Convert.ToDecimal(txtheight.Text) / 100))
        If rdlsex.SelectedValue = 0 Then
            SuggestBMR = 88.362 + (13.397 * Convert.ToDecimal(txtarw.Text)) + (4.799 * Convert.ToDecimal(txtheight.Text)) - (6.677 * Convert.ToDecimal(txtage.Text))
        ElseIf rdlsex.SelectedValue = 1 Then
            SuggestBMR = 447.593 + (9.274 * Convert.ToDecimal(txtarw.Text)) + (3.098 * Convert.ToDecimal(txtheight.Text)) - (4.33 * Convert.ToDecimal(txtage.Text))
        End If
        Dim createGoal As New SqlCommand("UPDATE projectUserinfo SET Age = @p1, Weight = @p2, Height = @p3, Sex= @p4,Current_BMR = @p7, Goal_Weight = @p8, Target_BMI = @p9, Goal = @p10, CTAL = @p5,@Current_BMI = @p11 WHERE UserID  = @p6", con)
        With createGoal.Parameters
            .Clear()
            .AddWithValue("@p1", Convert.ToDecimal(txtage.Text))

            .AddWithValue("@p2", Convert.ToDecimal(txtweight.Text))
            .AddWithValue("@p3", Convert.ToDecimal(txtheight.Text))
            .AddWithValue("@p4", rdlsex.SelectedValue)
            .AddWithValue("@p5", ddllevel.SelectedValue)
            .AddWithValue("@p6", UserID)
            .AddWithValue("@p7", Bmr)
            .AddWithValue("@p8", Convert.ToDecimal(txtarw.Text))
            .AddWithValue("@p9", target_BMI)
            .AddWithValue("@p10", ddlgoal.SelectedItem.Text)
            .AddWithValue("@p11", Current_BMI)




        End With
        If SuggestBMR < Bmr Then
            suggest.Text = "need to lower food input and workout more" & vbNewLine & "Suggest Calrios: " & SuggestBMR

        ElseIf SuggestBMR > Bmr Then
            suggest.Text = "need to eat more food" & vbNewLine & "Suggest Calrios: " & SuggestBMR

        End If


        Try 'for a SQLcommand we have to manually open the connection
            If con.State = ConnectionState.Closed Then con.Open()
            createGoal.ExecuteNonQuery() 'run my SQL do not return any data
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            con.Close()
        End Try
        UserView.DataBind()
        ddlgoal.Visible = True
    End Sub




    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles food_Sub.Click
        Dim UserID = Request.QueryString("UserID")
        Dim Calories As Decimal


        'entry protection, if food enter quantity is larger than it has 
        Dim decQuantity As Decimal
        Dim cmdCheckEntry As New SqlCommand("select Quantity From projectGrocery Where UserID = @p1 And ItemName = @p3", con)

        With cmdCheckEntry.Parameters
            .Clear()

            .AddWithValue("@p1", UserID)
            .AddWithValue("@p3", ddlfood.SelectedItem.Text)

        End With

        Try
            If con.State = ConnectionState.Closed Then con.Open()
            decQuantity = Convert.ToDecimal(cmdCheckEntry.ExecuteScalar)
            Response.Write(decQuantity)
        Catch ex As Exception
            Response.Write(ex.Message)

        Finally
            con.Close()
        End Try

        If Convert.ToDecimal(decQuantity) < Convert.ToDecimal(txtfoodqt.Text) Then
            Response.Write("Re-Enter, you don't have this amount of food")
        Else
            Calories = ddlfood.SelectedValue * Convert.ToDecimal(txtfoodqt.Text)
        End If
        Dim itemtype As String
        Dim get_type As New SqlDataAdapter("select Type From projectGrocery Where UserID = @p1 And ItemName = @p3", con)
        With get_type.SelectCommand.Parameters
            .Clear()

            .AddWithValue("@p1", UserID)
            .AddWithValue("@p3", ddlfood.SelectedItem.Text)

        End With

        Try
            Dim dt As New DataTable

            get_type.Fill(dt)
            itemtype = Convert.ToString(dt.Rows(0).Item(0))


        Catch ex As Exception
            Response.Write(ex.Message)

        Finally
            con.Close()
        End Try


        Dim foodentry As New SqlCommand("insert into projectfoodtrack values(@p1,@p2,@p3,@p4,@p5,@p6)", con)
        With foodentry.Parameters
            .Clear()
            .AddWithValue("@p1", Convert.ToInt32(UserID))
            .AddWithValue("@p2", ddlfood.SelectedItem.Text)
            .AddWithValue("@p3", Convert.ToDecimal(txtfoodqt.Text))
            .AddWithValue("@p4", Calories)
            .AddWithValue("@p5", Trackdate.Text)
            .AddWithValue("@p6", itemtype)




        End With
        Try 'for a SQLcommand we have to manually open the connection
            If con.State = ConnectionState.Closed Then con.Open()
            foodentry.ExecuteNonQuery() 'run my SQL do not return any data
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            con.Close()
        End Try
        gdvfood.DataBind()

        Dim createGoal As New SqlCommand("UPDATE projectGrocery SET Quantity = Quantity - @p1 WHERE UserID  = @p2 and ItemName = @p3", con)
        With createGoal.Parameters
            .Clear()
            .AddWithValue("@p1", Convert.ToDecimal(txtfoodqt.Text))
            .AddWithValue("@p2", UserID)
            .AddWithValue("@p3", ddlfood.SelectedItem.Text)

        End With
        Try 'for a SQLcommand we have to manually open the connection
            If con.State = ConnectionState.Closed Then con.Open()
            createGoal.ExecuteNonQuery() 'run my SQL do not return any data
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            con.Close()
        End Try
        Dim deleteemptyEntry As New SqlCommand("delte from projectGrocery where Quantity = 0", con)
        Try 'for a SQLcommand we have to manually open the connection
            If con.State = ConnectionState.Closed Then con.Open()
            deleteemptyEntry.ExecuteNonQuery() 'run my SQL do not return any data
        Catch ex As Exception
            Response.Write(ex.Message)
        Finally
            con.Close()
        End Try
        'reupdate the aviable food list
        ddlfood.DataBind()





    End Sub







    'Protected Sub datebutton_Click(sender As Object, e As EventArgs) Handles datebutton.Click
    '    Dim UserID = Request.QueryString("UserID")
    '    Dim createentry As New SqlCommand("insert into projecttracker (UserID,date) Values(@p1,@p2)", con)
    '    With createentry.Parameters
    '        .Clear()
    '        .AddWithValue("@p1", UserID)
    '        .AddWithValue("@p2", Trackdate.Text)

    '    End With
    '    Try 'for a SQLcommand we have to manually open the connection
    '        If con.State = ConnectionState.Closed Then con.Open()
    '        createentry.ExecuteNonQuery() 'run my SQL do not return any data
    '    Catch ex As Exception
    '        Response.Write(ex.Message)
    '    Finally
    '        con.Close()
    '    End Try
    'End Sub

    Protected Sub LinkButton4_Click(sender As Object, e As EventArgs) Handles LinkButton4.Click
        MultiView1.ActiveViewIndex = 2
        MultiView2.ActiveViewIndex = 1
    End Sub

    Protected Sub LinkButton5_Click(sender As Object, e As EventArgs) Handles LinkButton5.Click
        MultiView1.ActiveViewIndex = 2
        MultiView2.ActiveViewIndex = 2
    End Sub

    Protected Sub Excercise_Sub_Click(sender As Object, e As EventArgs) Handles Excercise_Sub.Click
        Dim UserID = Request.QueryString("UserID")
        Dim Calories As Decimal
        Dim Duration As Integer
        Dim maxheart As Decimal
        Dim workoutlevel, Heartrate, diff As Decimal

        'get user max heart rate base on their age
        Dim cmdCheckmaxheart As New SqlCommand("select Age From projectUserinfo Where UserID = @p1", con)
        Heartrate = Convert.ToDecimal(txthr.Text)
        With cmdCheckmaxheart.Parameters
            .Clear()

            .AddWithValue("@p1", UserID)


        End With

        Try
            If con.State = ConnectionState.Closed Then con.Open()
            maxheart = 220 - cmdCheckmaxheart.ExecuteScalar

        Catch ex As Exception
            Response.Write(ex.Message)

        Finally
            con.Close()
        End Try

        diff = Heartrate - maxheart

        ''calculate workout level by heart rate
        'Select Case diff
        '    Case 0 To 30
        '        workoutlevel = 1
        '    Case 31 To 70
        '        workoutlevel = 2
        '    Case 70 To 100
        '        workoutlevel = 3
        '    Case Else
        '        Response.Write("Excercis Heart rate reach max")
        'End Select


        If 0 < diff < 30 Then
            workoutlevel = 1
        ElseIf 31 < diff < 71 Then
            workoutlevel = 2
        ElseIf 70 < diff < 300 Then
            workoutlevel = 3
        Else
            Response.Write("Excercis Heart rate reach max")
        End If







        Calories = Convert.ToDecimal(txtcb.Text)

        Duration = Convert.ToInt32(txtmin.Text)

        Dim workoutentry As New SqlCommand("insert into projectworkout values(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8)", con)
        With workoutentry.Parameters
            .Clear()
            .AddWithValue("@p1", Convert.ToInt32(UserID))
            .AddWithValue("@p2", txtex.Text)
            .AddWithValue("@p3", Duration)
            .AddWithValue("@p4", Calories)
            .AddWithValue("@p5", txtnotes.Text)
            .AddWithValue("@p6", Trackdate.Text)
            .AddWithValue("@p7", workoutlevel)
            .AddWithValue("@p8", Heartrate)
        End With

        Try
            If con.State = ConnectionState.Closed Then con.Open()
            workoutentry.ExecuteNonQuery()
        Catch ex As Exception
            Response.Write(ex.Message)

        Finally
            con.Close()
        End Try
        gdvexcerise.DataBind()
    End Sub



    Protected Sub LinkButton7_Click(sender As Object, e As EventArgs) Handles LinkButton7.Click
        MultiView1.ActiveViewIndex = 2
        MultiView2.ActiveViewIndex = 3
    End Sub





    Protected Sub deletworkout_Click(sender As Object, e As EventArgs) Handles deletworkout.Click
        'delete row base on select row
        Dim UserID = Request.QueryString("UserID")

        Using cmd As New SqlCommand("Delete From projectworkout where trackerID = @p1 ", con)
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@p1", Convert.ToDecimal(ddlworkoutdelete.SelectedValue))

            con.Open()
            Dim rowsAffected = cmd.ExecuteNonQuery()
            con.Close()

        End Using
        gdvexcerise.DataBind()
    End Sub




    Protected Sub datebutton_Click(sender As Object, e As EventArgs) Handles datebutton.Click
        LinkButton4.Visible = True
        LinkButton5.Visible = True
        Dim UserID = Request.QueryString("UserID")
        'isnert an empty row with date and UserID
        Dim workoutentry As New SqlCommand("insert into projecttracker values(@p1,@p2,0,0,0,0,0,0)", con)
        With workoutentry.Parameters
            .Clear()
            .AddWithValue("@p1", Convert.ToInt32(UserID))


            .AddWithValue("@p2", Trackdate.Text)

        End With

        Try
            If con.State = ConnectionState.Closed Then con.Open()
            workoutentry.ExecuteNonQuery()
        Catch ex As Exception
            Response.Write(ex.Message)

        Finally
            con.Close()
        End Try






    End Sub

    Protected Sub Refresh_Click(sender As Object, e As EventArgs) Handles Refresh.Click
        GridView1.DataBind()
    End Sub

    Protected Sub MultiView1_ActiveViewChanged(sender As Object, e As EventArgs) Handles MultiView1.ActiveViewChanged

    End Sub

    Protected Sub foodtrackdelete_Click(sender As Object, e As EventArgs) Handles foodtrackdelete.Click
        'delete row base on select row
        Dim UserID = Request.QueryString("UserID")

        Using cmd As New SqlCommand("Delete From projectfoodtrack where foodid = @p1 ", con)
            cmd.CommandType = CommandType.Text
            cmd.Parameters.AddWithValue("@p1", Convert.ToDecimal(fooddelete.SelectedValue))

            con.Open()
            Dim rowsAffected = cmd.ExecuteNonQuery()
            con.Close()

        End Using
        gdvfood.DataBind()
    End Sub
End Class




