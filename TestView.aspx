<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TestView.aspx.cs" Inherits="UnistoreWeb.TestView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <section id="account-header"><h2>View Booking</h2></section>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Booking details" Font-Underline="True"></asp:Label>
    <br />
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="405px" DataSourceID="SqlDataSource1"></asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Items stored" Font-Underline="True"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID" DataSourceID="SqlDataSource2" Width="657px">
        <Columns>
            <asp:BoundField DataField="ItemID" HeaderText="Item ID" InsertVisible="False" ReadOnly="True" SortExpression="ItemID" />
            <asp:BoundField DataField="Dimension" HeaderText="Dimension" SortExpression="Dimension" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:CheckBoxField DataField="Checkedin" HeaderText="Checked in" SortExpression="Checkedin" />
            <asp:CheckBoxField DataField="CheckedOut" HeaderText="Checked out" SortExpression="CheckedOut" />
        </Columns>
    </asp:GridView>



    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ItemID], [Dimension], [Description], [Checkedin], [CheckedOut] FROM [Item] WHERE ([TrackingNum] = ?)">
        <SelectParameters>
            <asp:SessionParameter Name="TrackingNum" SessionField="trr" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

     <br />
    <table><tr><td>
        <asp:Button ID="Button1" runat="server" Text="Cancel booking" Width="150px" OnClick="Button1_Click" /></td><td>
            <asp:Button ID="Button2" runat="server" Text="Back" OnClick="Button2_Click" Width="150px" /></td></tr></table>
    
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
