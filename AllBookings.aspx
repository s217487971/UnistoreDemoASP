<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AllBookings.aspx.cs" Inherits="UnistoreWeb.AllBookings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Bookings
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
     University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">


   <section id="account-header"><h2>Students Bookings</h2></section>

    <table><tr><td>
        <asp:TextBox ID="TrackingNum" runat="server" Width="170px" TextMode="Number"></asp:TextBox>

        </td><td>
            <asp:Button ID="Button1" runat="server" Text="Search" Width="160px" OnClick="Button1_Click" />
        &nbsp;<asp:Label ID="feedback" runat="server"></asp:Label>
        </td></tr>
        <tr><td colspan="2">
            <asp:RadioButtonList ID="searchby" runat="server" CellSpacing="5" RepeatDirection="Horizontal">
                <asp:ListItem Selected="True" Value="1">Student number</asp:ListItem>
                <asp:ListItem Value="2">Tracking number</asp:ListItem>
            </asp:RadioButtonList>
            </td><td></td></tr>
    </table>
    
   
    
    <br />
   

    <table><tr><td> <asp:Button ID="Button2" runat="server" Text="Cancellations" Height="25px" Width="160px" Onclick="Button2_Click"/></td><td>
        <asp:Button ID="Button4" runat="server" Text="Show all" Height="25px" OnClick="Button4_Click" Width="160px" /></td></tr></table>
    <asp:Button CssClass="back" ID="Button3" runat="server" Text="Back" Height="25px" OnClick="Button3_Click" Width="160px" />
    <br />
    <br />
    <asp:GridView CssClass="bookings" ID="Bookings" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
        <Columns>
            <asp:BoundField DataField="TrackingNum" HeaderText="TrackingNum" InsertVisible="False" SortExpression="TrackingNum" />
            <asp:BoundField DataField="UnitNum" HeaderText="UnitNum" SortExpression="UnitNum" />
            <asp:BoundField DataField="StudNum" HeaderText="StudNum" SortExpression="StudNum" />
            <asp:BoundField DataField="DateBooked" HeaderText="DateBooked" SortExpression="DateBooked" />
            <asp:BoundField DataField="Fee" HeaderText="Fee" SortExpression="Fee" />
            <asp:CheckBoxField DataField="Paid" HeaderText="Paid" SortExpression="Paid" />
            <asp:BoundField DataField="CheckInDate" HeaderText="CheckInDate" SortExpression="CheckInDate" />
            <asp:BoundField DataField="CheckOutDate" HeaderText="CheckOutDate" SortExpression="CheckOutDate" />
            <asp:BoundField DataField="CancelledDate" HeaderText="CancelledDate" SortExpression="CancelledDate" />
        </Columns>
    </asp:GridView>
    


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT Booking.TrackingNum, Booking.UnitNum, Booking.StudNum, Booking.DateBooked, UnitSize.Fee, Booking.Paid, Booking.CheckInDate, Booking.CheckOutDate, Booking.CancelledDate FROM ((UnitSize INNER JOIN StorageUnit ON UnitSize.UnitSize = StorageUnit.UnitSize) INNER JOIN Booking ON StorageUnit.UnitId = Booking.UnitNum)"></asp:SqlDataSource>
    


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
