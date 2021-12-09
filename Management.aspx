<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="UnistoreWeb.Management" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University storage system
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <section id="account-header"><h2>Management</h2></section>
    <div >
        <table class="buttons">
            <tr><td>
                <asp:Button ID="Button1" runat="server" Height="30px" Text="Accounts" Width="200px" OnClick="Button1_Click" />
                </td></tr>
            <tr><td>
                <asp:Button ID="Button2" runat="server" Height="30px" Text="Bookings" Width="200px" OnClick="Button2_Click" />
                </td></tr>
            <tr><td>
                <asp:Button ID="Button3" runat="server" Height="30px" Text="Storage" Width="200px" OnClick="Button3_Click" />
                </td></tr>
            <tr><td>
                <asp:Button ID="Button4" runat="server" Height="30px" Text="Check in" Width="200px" OnClick="Button4_Click" />
                </td></tr>
            <tr><td style="height: 38px">
                <asp:Button ID="Button5" runat="server" Height="30px" Text="Check out" Width="200px" OnClick="Button5_Click" />
                </td></tr>
        </table>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
