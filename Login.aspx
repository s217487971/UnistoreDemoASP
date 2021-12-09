<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UnistoreWeb.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Login
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
     University Storahe system
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">

     <section id="account-header"><h2>Login</h2></section>

    <table>
        <tr><td>Email:</td><td>
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Invalid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td></tr>
        <tr><td>Password:</td><td>
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
            </td></tr>
        <tr><td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" Width="126px" Height="30px" />
            </td><td></td></tr>
    </table>



    <p>
        <asp:Label ID="feedback" runat="server"></asp:Label>
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
