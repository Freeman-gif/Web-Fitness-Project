Imports System.Data.OleDb
Imports System.Web
Imports System.IO

Imports System.Data
Imports System.Data.SqlClient
Partial Class project_login
    Inherits System.Web.UI.Page
    Private Shared con As New SqlConnection("Data Source = cb-ot-devst06.ad.wsu.edu; initial catalog = MF21zhiyuan.chen2; Persist Security Info = True;User ID=zhiyuan.chen2 ;Password=0ef7143e ")

    Protected Sub btlogin_Click(sender As Object, e As EventArgs) Handles btlogin.Click
        Dim decAnswer As Decimal
        Dim cmdCheckEntry As New SqlCommand("select Count(*) From projectUser Where Username = @p1 And Password = @p3", con)

        With cmdCheckEntry.Parameters
            .Clear()

            .AddWithValue("@p1", txtlguser.Text)
            .AddWithValue("@p3", txtlgpd.Text)

        End With

        Try
            If con.State = ConnectionState.Closed Then con.Open()
            decAnswer = cmdCheckEntry.ExecuteScalar
        Catch ex As Exception
            Response.Write(ex.Message)

        Finally
            con.Close()
        End Try

        If decAnswer = 0 Then
            MultiView1.ActiveViewIndex = 1
            Response.Write("Not a registrant")
        ElseIf decAnswer = 1 Then
            Dim dt As New DataTable
            Dim ID As New SqlDataAdapter("select UserID From projectUSer where Username = @p2", con)
            With ID.SelectCommand.Parameters
                .Clear()
                .AddWithValue("@p2", txtlguser.Text)
            End With
            ID.Fill(dt)
            Dim UserID As String = Convert.ToString(dt.Rows(0).Item(0))
            Response.Redirect("https://cb-ot-devst06.ad.wsu.edu\MF21zhiyuan.chen2/project%20-%20Copy/main.aspx?UserID=" + UserID)
            System.Web.HttpContext.Current.Session("Usernname") = txtlguser.Text
            System.Web.HttpContext.Current.Session("Password") = txtlgpd.Text
        End If

    End Sub

    Protected Sub reg_Click(sender As Object, e As EventArgs) Handles back.Click
        Dim decAnswer As Decimal
        Dim Createlogin As New SqlCommand("storeinfo", con)
        Createlogin.CommandType = CommandType.StoredProcedure
        Dim p1 As New SqlParameter("Username", txtregName.Text)
        Dim p2 As New SqlParameter("Password", txtregpd.Text)
        Createlogin.Parameters.Add(p1)
        Createlogin.Parameters.Add(p2)
        con.Open()
        Createlogin.ExecuteNonQuery()
        Labelreg.Text = "registered successful."





        '        create PROCEDURE storeinfo
        '(
        '@Username as varchar(50),

        '@Password as varchar(50)) 
        'As insert into projectUSer Values(@Username,@Password)

        'create trigger, everytime create a user, create a empty user profile
        '        create trigger new_user_info on projectUSer
        'after insert
        'As
        'begin
        '        insert into projectUserinfo(UserID)
        'values((select UserID from inserted))
        'End









    End Sub

    Protected Sub login_Click(sender As Object, e As EventArgs) Handles login.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub LinkButton2_Click(sender As Object, e As EventArgs) Handles LinkButton2.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub back_Click(sender As Object, e As EventArgs) Handles back.Click

        MultiView1.ActiveViewIndex = 0
    End Sub


End Class
