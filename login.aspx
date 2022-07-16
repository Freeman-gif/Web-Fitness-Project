<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="project_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 100%;
            height: 92px;
        }
        .auto-style5 {
            font-size: x-large;
            color: #008000;
        }
        .auto-style6 {
            color: #008000;
        }
        .auto-style7 {
            width: 130px;
        }
        .auto-style8 {
            width: 145px;
        }
        .auto-style9 {
            margin-left: 0px;
        }
        .auto-style10 {
            width: 193px;
        }
        .auto-style11 {
            color: maroon;
            font-style: italic;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span class="auto-style5"><strong>
            <br />
            Welcome to Washington State University&#39;s URec &quot;CougFitnessPal&quot;</strong></span><br />
            <i>If you are a first time user, please select the register button to setup your account.
            <br />
            If you are an exsisting user, please select the login button to access your account.</i><br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style7">
                        <asp:LinkButton ID="login" runat="server" CssClass="auto-style6">Login</asp:LinkButton>
                    </td>
                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server" CssClass="auto-style6">Register</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <br />
            <asp:MultiView ID="MultiView1" runat="server">
                <asp:View ID="View1" runat="server">
                    <br />
                    <br />
                    <table class="auto-style2">
                        <tr>
                            <td class="auto-style8">Enter Username</td>
                            <td>
                                <asp:TextBox ID="txtlguser" runat="server" Width="286px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style8">Enter Password</td>
                            <td>
                                <asp:TextBox ID="txtlgpd" runat="server" Width="279px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Button ID="btlogin" runat="server" Text="Login" />
                    <br />
                    <br />
                    <br />
                </asp:View>
                <br />
                <asp:View ID="View2" runat="server">
                    <br />
                    <asp:Label ID="Labelreg" runat="server" Text="Label"></asp:Label>
                    <br />
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style10">Create a Username</td>
                            <td>
                                <asp:TextBox ID="txtregName" runat="server" CssClass="auto-style9"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style10">Create a Password</td>
                            <td>
                                <asp:TextBox ID="txtregpd" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <span class="auto-style11">*Please double check spelling before creating your account*</span><br />
                    <br />
                    <asp:Button ID="back" runat="server" Text="Create Account " />
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
            </asp:MultiView>
            <br />
            <br />
        </div>
    </form>
</body>
</html>
