<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="UnistoreWeb.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Logout
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
      University Storahe system
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">

    <section id="account-header"><h2>Logout</h2></section>
    <p>Are you sure you want to logout ?</p>
    <br />
    <table><tr><td>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Confirm" Height="30px" Width="126px" />
        </td><td>
            <asp:Button ID="Button2" runat="server" Text="Cancel" Height="30px" OnClick="Button2_Click" Width="126px" />
        </tr></table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
