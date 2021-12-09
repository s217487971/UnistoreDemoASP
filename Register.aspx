<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="UnistoreWeb.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Register
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University Storahe system
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">

    <section id="account-header"><h2>Register</h2></section>

    <table>
        <tr><td>
            Student number:</td><td>
                <asp:TextBox ID="studNum" runat="server" OnTextChanged="studNum_TextChanged"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Student number is required" ControlToValidate="studNum"></asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>Name:</td><td>
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
            </td></tr>
        <tr><td>Surname:</td><td>
            <asp:TextBox ID="surname" runat="server"></asp:TextBox>
            </td></tr>
        <tr><td>Cell No:</td><td>
            <asp:TextBox ID="cell" runat="server"></asp:TextBox>
            </td></tr>
        <tr><td>Email:</td><td>
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="Enter a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td></tr>
        <tr><td>Password</td><td>
            <asp:TextBox ID="password" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password" ErrorMessage="Enter password"></asp:RequiredFieldValidator>
            </td></tr>
        <tr><td style="height: 27px">Confirm password</td><td style="height: 27px">
            <asp:TextBox ID="confirmpassword" runat="server" TextMode="Password"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="confirmpassword" ErrorMessage="Confirm password"></asp:RequiredFieldValidator>
            <br />
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="password" ControlToValidate="confirmpassword" ErrorMessage="Password does not match"></asp:CompareValidator>
            </td></tr>
        <tr><td>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" Width="188px" />
            </td><td>
                <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" Width="175px" />
                <asp:Label ID="fd" runat="server"></asp:Label>
            </td></tr>
    </table>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
