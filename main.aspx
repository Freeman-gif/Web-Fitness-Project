<%@ Page Language="VB" AutoEventWireup="false" CodeFile="main.aspx.vb" Inherits="project_main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            width: 125px;
        }
        .auto-style5 {
            width: 742px;
        }
        .auto-style8 {
            height: 26px;
        }
        .auto-style9 {
            width: 53%;
        }
        .auto-style11 {
            width: 742px;
            height: 30px;
        }
        .auto-style12 {
            height: 30px;
        }
        .auto-style13 {
            width: 100%;
            height: 471px;
        }
        .auto-style14 {
            width: 511px;
        }
        .auto-style17 {
            width: 174px;
        }
        .auto-style18 {
            width: 124px;
        }
        .auto-style19 {
            font-size: large;
            color: #008000;
        }
        .auto-style20 {
            color: #008000;
        }
        .auto-style21 {
            width: 168px;
        }
        .auto-style22 {
            color: green;
            font-style: italic;
        }
        .auto-style23 {
            width: 259px;
        }
        .auto-style24 {
            width: 259px;
            height: 26px;
        }
        .auto-style25 {
            width: 139px;
        }
        .auto-style28 {
            width: 44%;
        }
        .auto-style29 {
            width: 382px;
        }
        .auto-style30 {
            width: 133px;
        }
        .auto-style32 {
            height: 26px;
            width: 193px;
        }
        .auto-style34 {
            width: 193px;
            height: 33px;
        }
        .auto-style35 {
            height: 33px;
        }
        .auto-style38 {
            width: 193px;
            height: 30px;
        }
        .auto-style39 {
            width: 193px;
            height: 96px;
        }
        .auto-style40 {
            height: 96px;
        }
        .auto-style41 {
            width: 193px;
            height: 42px;
        }
        .auto-style42 {
            height: 42px;
        }
        .auto-style43 {
            height: 7px;
            width: 193px;
        }
        .auto-style44 {
            height: 7px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <strong>
            <br class="auto-style19" />
            </strong><span class="auto-style19"><strong>Welcome to CougFitnessPal</strong></span><strong><br class="auto-style19" />
            </strong>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style17">
                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="auto-style20">Insert Purchased Food</asp:LinkButton>
                    </td>
                    <td class="auto-style18">
                        <asp:LinkButton ID="Goal" runat="server" CssClass="auto-style20">Goal Setting</asp:LinkButton>
                    </td>
                    <td class="auto-style21">
                        <asp:LinkButton ID="LinkButton3" runat="server" CssClass="auto-style20">Daily Tracking</asp:LinkButton>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                </table>
            <br />
        </div>
        <asp:MultiView ID="MultiView1" runat="server">
            <br />
            <asp:View ID="View1" runat="server">
                <br />
                <span class="auto-style22">Enter purchased groceries information here to automatically access your exsisting food when you use the &quot;Daily Trackng&quot; page.</span><br />
                <br />
                <table class="auto-style9">
                    <tr>
                        <td>Food Name</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtitem" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Servings in Package</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtqty" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Calories per Serving</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txtcal" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Meal Category</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="0">Select Food Type</asp:ListItem>
                                <asp:ListItem Value="1">Snack</asp:ListItem>
                                <asp:ListItem Value="2">Fruit</asp:ListItem>
                                <asp:ListItem Value="3">Meat</asp:ListItem>
                                <asp:ListItem Value="4">Vegetable</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Button ID="insert" runat="server" Text="Enter Food Item" />
                        </td>
                        <td class="auto-style3">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;Delete foods from the table by selecting the item from the drop down list, then pressing the button.</td>
                        <td class="auto-style3">
                            <asp:DropDownList ID="ddldelteitem" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ItemName" DataValueField="ItemName">
                            </asp:DropDownList>
                            <br />
                            <asp:Button ID="Delete" runat="server" Text="Delete Food Item" />
                        </td>
                    </tr>
                </table>
                <br />
                <asp:GridView ID="gdvGrocery" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                        <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                        <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MF21zhiyuan.chen2ConnectionString %>" SelectCommand="SELECT [ItemName], [Calories], [Quantity], [Type] FROM [projectGrocery] WHERE ([UserID] = @UserID)">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="UserID" QueryStringField="UserID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
            </asp:View>
            <br />
            <br />
            <br />
            <asp:View ID="UserInfo" runat="server">
                <br />
                <span class="auto-style22">Please enter in the following information to determine your fitness goal and track your progress.</span><br />
                <br />
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style23">Age </td>
                        <td>
                            <asp:TextBox ID="txtage" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Sex</td>
                        <td>
                            <asp:RadioButtonList ID="rdlsex" runat="server" AutoPostBack="True" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">Male</asp:ListItem>
                                <asp:ListItem Value="1">Female</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Weight (kg)</td>
                        <td>
                            <asp:TextBox ID="txtweight" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">Height (cm)</td>
                        <td>
                            <asp:TextBox ID="txtheight" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style24">What is your current activity level?</td>
                        <td class="auto-style8">
                            <asp:DropDownList ID="ddllevel" runat="server" AutoPostBack="True">
                                <asp:ListItem Value="0">Select Item</asp:ListItem>
                                <asp:ListItem Value="1">Sedentary (little to no exercise)</asp:ListItem>
                                <asp:ListItem Value="2">Lightly Active (light exercise/sport 1-3 days/week)</asp:ListItem>
                                <asp:ListItem Value="3">Moderately Active (moderate exercise/sports 3-5 days/week)</asp:ListItem>
                                <asp:ListItem Value="4">Very Active (hard exercise/sports 3-5 days/week)</asp:ListItem>
                                <asp:ListItem Value="5">Extra Active (very hard exercise/sports &amp; physical job or 2x training)</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style24">Select your fitness goal</td>
                        <td class="auto-style8">
                            <asp:DropDownList ID="ddlgoal" runat="server" Height="16px">
                                <asp:ListItem>Select Goal</asp:ListItem>
                                <asp:ListItem>Loss</asp:ListItem>
                                <asp:ListItem>Matinatince </asp:ListItem>
                                <asp:ListItem>Gain</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">What is your target weight in kg?</td>
                        <td>
                            <asp:TextBox ID="txtarw" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style23">
                            <asp:Button ID="Button1" runat="server" Text="Enter" />
                        </td>
                        <td>
                            <asp:TextBox ID="suggest" runat="server" Height="225px" TextMode="MultiLine" Width="329px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                <asp:DetailsView ID="UserView" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource2" Height="50px" Width="125px" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
                    <Fields>
                        <asp:BoundField DataField="Age" HeaderText="Age" SortExpression="Age" />
                        <asp:BoundField DataField="Weight" HeaderText="Weight" SortExpression="Weight" />
                        <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
                        <asp:CheckBoxField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                        <asp:BoundField DataField="Current_BMR" HeaderText="Current_BMR" SortExpression="Current_BMR" />
                        <asp:BoundField DataField="Goal_Weight" HeaderText="Goal_Weight" SortExpression="Goal_Weight" />
                        <asp:BoundField DataField="Target_BMI" HeaderText="Target_BMI" SortExpression="Target_BMI" />
                        <asp:BoundField DataField="Goal" HeaderText="Goal" SortExpression="Goal" />
                        <asp:BoundField DataField="CTAL" HeaderText="CTAL" SortExpression="CTAL" />
                        <asp:BoundField DataField="Current_BMI" HeaderText="Current_BMI" SortExpression="Current_BMI" />
                    </Fields>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MF21zhiyuan.chen2ConnectionString %>" SelectCommand="SELECT [Age], [Weight], [Height], [Sex], [Current_BMR], [Goal_Weight], [Target_BMI], [Goal], [CTAL], [Current_BMI] FROM [projectUserinfo] WHERE ([UserID] = @UserID)">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="UserID" QueryStringField="UserID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style11"></td>
                        <td class="auto-style12">
                            <asp:Button ID="Button2" runat="server" Text="Start My Journey" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
                <br />
            </asp:View>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <asp:View ID="View3" runat="server">
                <br />
                <br />
                <br />
                <asp:MultiView ID="MultiView2" runat="server">
                    <br />
                    <br />
                    <br />
                    <asp:View ID="View4" runat="server">
                        <br />
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style25">
                                    <asp:LinkButton ID="LinkButton4" runat="server" CssClass="auto-style20">Calorie Tracking</asp:LinkButton>
                                </td>
                                <td class="auto-style30">
                                    <asp:LinkButton ID="LinkButton5" runat="server" CssClass="auto-style20">Exericse Tracking</asp:LinkButton>
                                </td>
                                <td>
                                    <asp:LinkButton ID="LinkButton7" runat="server" CssClass="auto-style20">Summary Tracking Information</asp:LinkButton>
                                </td>
                            </tr>
                        </table>
                        <table class="auto-style28">
                            <tr>
                                <td class="auto-style29">Please select the date you want to enter data for</td>
                                <td>
                                    <asp:TextBox ID="Trackdate" runat="server" TextMode="Date"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style29">
                                    <asp:Button ID="datebutton" runat="server" Text="Enter Data" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                    </asp:View>
                    <br />
                    <asp:View ID="View5" runat="server">
                        <br />
                        <table class="auto-style1">
                            <tr>
                                <td class="auto-style14">Select Food</td>
                                <td>
                                    <asp:DropDownList ID="ddlfood" runat="server" DataSourceID="SqlDataSource5" DataTextField="ItemName" DataValueField="Calories">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:MF21zhiyuan.chen2ConnectionString %>" SelectCommand="SELECT [ItemName], [Calories] FROM [projectGrocery] WHERE ([UserID] = @UserID)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter DefaultValue="0" Name="UserID" QueryStringField="UserID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">Servings</td>
                                <td>
                                    <asp:TextBox ID="txtfoodqt" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    <asp:Button ID="food_Sub" runat="server" Text="Enter Food" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    <asp:GridView ID="gdvfood" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource4" ForeColor="#333333" GridLines="None" Height="164px" Width="239px" DataKeyNames="foodid">
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                                            <asp:BoundField DataField="Calories" HeaderText="Calories" SortExpression="Calories" />
                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                                            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                            <asp:BoundField DataField="foodid" HeaderText="foodid" InsertVisible="False" ReadOnly="True" SortExpression="foodid" />
                                        </Columns>
                                        <EditRowStyle BackColor="#7C6F57" />
                                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#E3EAEB" />
                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MF21zhiyuan.chen2ConnectionString %>" SelectCommand="SELECT [ItemName], [Calories], [Quantity], [Date], [Type], [foodid] FROM [projectfoodtrack] WHERE ([UserID] = @UserID)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter DefaultValue="0" Name="UserID" QueryStringField="UserID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    <asp:Button ID="foodtrackdelete" runat="server" Text="Delete Entry" />
                                </td>
                                <td>
                                    <asp:DropDownList ID="fooddelete" runat="server" DataSourceID="SqlDataSource7" DataTextField="foodid" DataValueField="foodid">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:MF21zhiyuan.chen2ConnectionString %>" SelectCommand="SELECT [foodid] FROM [projectfoodtrack] WHERE ([UserID] = @UserID)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter DefaultValue="0" Name="UserID" QueryStringField="UserID" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <br />
                    <br />
                    <asp:View ID="View6" runat="server">
                        <br />
                        <table class="auto-style13">
                            <tr>
                                <td class="auto-style43">Excerise </td>
                                <td class="auto-style44">
                                    <asp:TextBox ID="txtex" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style32">Duration (min)</td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="txtmin" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style38">Calories Burned</td>
                                <td class="auto-style12">
                                    <asp:TextBox ID="txtcb" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style38">Heart Rate Per Minute</td>
                                <td class="auto-style12">
                                    <asp:TextBox ID="txthr" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style39">Notes &amp; Comments:</td>
                                <td class="auto-style40">
                                    <asp:TextBox ID="txtnotes" runat="server" Height="118px" TextMode="MultiLine" Width="459px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style34">
                                    <asp:Button ID="Excercise_Sub" runat="server" Text="Enter Workout" />
                                </td>
                                <td class="auto-style35"></td>
                            </tr>
                            <tr>
                                <td class="auto-style41">
                                    <asp:Button ID="deletworkout" runat="server" Text="Delete a Workout" />
                                </td>
                                <td class="auto-style42">
                                    <asp:DropDownList ID="ddlworkoutdelete" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="trackerID" DataValueField="trackerID">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        <asp:GridView ID="gdvexcerise" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource6" ForeColor="#333333" GridLines="None" Width="604px">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Excercise" HeaderText="Excercise" SortExpression="Excercise" />
                                <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                                <asp:BoundField DataField="Calrios" HeaderText="Calrios" SortExpression="Calrios" />
                                <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                                <asp:BoundField DataField="workout_level" HeaderText="workout_level" SortExpression="workout_level" />
                                <asp:BoundField DataField="Heartbeat" HeaderText="Heartbeat" SortExpression="Heartbeat" />
                                <asp:BoundField DataField="trackerID" HeaderText="trackerID" InsertVisible="False" ReadOnly="True" SortExpression="trackerID" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:MF21zhiyuan.chen2ConnectionString %>" SelectCommand="SELECT [Excercise], [Duration], [Calrios], [Notes], [date], [workout_level], [Heartbeat], [trackerID] FROM [projectworkout] WHERE ([UserID] = @UserID)">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="UserID" QueryStringField="UserID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                    </asp:View>
                    &nbsp;<br />
                    <br />
                    <asp:View ID="View7" runat="server">
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Height="150px" Width="664px" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                                <asp:BoundField DataField="day_cal" HeaderText="day_cal" SortExpression="day_cal" />
                                <asp:BoundField DataField="day_exercise_cal" HeaderText="day_exercise_cal" SortExpression="day_exercise_cal" />
                                <asp:BoundField DataField="day_food_cal" HeaderText="day_food_cal" SortExpression="day_food_cal" />
                            </Columns>
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MF21zhiyuan.chen2ConnectionString %>" SelectCommand="SELECT [date], [day_cal], [day_exercise_cal], [day_food_cal] FROM [projecttracker] WHERE ([UserID] = @UserID)">
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="UserID" QueryStringField="UserID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <br />
                        <asp:Button ID="Refresh" runat="server" Text="Refresh" />
                        <br />
                        <br />
                        <br />
                        <br />
                    </asp:View>
                    <br />
                </asp:MultiView>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </asp:View>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            \
        </asp:MultiView>
    </form>
</body>
   <system.web>
      <pages enableSessionState="true" /> 
 </system.web>
</html>
