<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Bookings.aspx.cs" Inherits="UnistoreWeb.Bookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <section id="account-header"><h2> Storage Bookings</h2></section>

       <section class="container">
           <table class="buttons">
               <tr>
                   <td>
                        <asp:Button ID="Button1" runat="server" Text="Create New Booking" OnClick="Create_Booking" Height="30px" Width="200px"/>
                   </td>
               </tr>
               <tr>
                   <td>
                        <asp:Button ID="Button2" runat="server" Text="View Existing Booking" OnClick="View_Bookings" Height="30px" Width="200px"/>
                   </td>
               </tr>
           </table>
        </section>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content> 
