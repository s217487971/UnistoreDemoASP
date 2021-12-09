<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StudentAccount.aspx.cs" Inherits="UnistoreWeb.StudentAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Account
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    university storage system
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">


    <section id="account-header"><h2>Account</h2></section>

    <table class="account">
        <tr><td>
            Student number:</td><td>
                <asp:Label ID="studentNum" runat="server"></asp:Label>
            </td></tr>
        <tr><td>Name:</td><td>
            <asp:TextBox ID="name" runat="server" Width="150px"></asp:TextBox>
            </td></tr>
        <tr><td>Surname:</td><td>
            <asp:TextBox ID="surname" runat="server" Width="150px"></asp:TextBox>
            </td></tr>
        <tr><td>Cell No:</td><td>
            <asp:TextBox ID="cell" runat="server" Width="150px"></asp:TextBox>
            </td></tr>
        <tr><td>Email:</td><td>
            <asp:TextBox ID="email" runat="server" Width="150px"></asp:TextBox>
            </td></tr>
        <tr><td>Password</td><td>
            <asp:TextBox ID="password" runat="server" Width="150px"></asp:TextBox>
            </td></tr>
        <tr><td style="height: 27px">Confirm password</td><td style="height: 27px">
            <asp:TextBox ID="confirmpassword" runat="server" Width="150px"></asp:TextBox>
            </td></tr>
        <tr><td>
            <asp:Button ID="Button1" runat="server" Text="Upadate" Width="175px" Height="30px" OnClick="Button1_Click" />
            </td><td>
                <asp:Button ID="Button2" runat="server" Text="Cancel" Width="150px" Height="30px" />
            </td></tr>
    </table>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
