<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ConfitmBooking.aspx.cs" Inherits="UnistoreWeb.ConfitmBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University storage system
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <section id="account-header"><h2>Confirm Booking</h2></section>
    <br />

    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px"></asp:DetailsView>

    <br />
    <br />

    <table ID="Table2" runat="server">
                  <tr ><th>Number</th><th>Description</th><th>Dimension</th></tr>

        </table>
    <br />
    <br />

    <table><tr><td>
        <asp:Button ID="Button1" runat="server" Text="Confirm" OnClick="Button1_Click" Width="150px" /></td><td><asp:Button ID="Button2" runat="server" Text="Cancel" Width="150px" />
       </td></tr></table>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
