<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TestStudent.aspx.cs" Inherits="UnistoreWeb.TestStudent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University storage system
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
     <section id="account-header"><h2>Account</h2></section>

    <br />
    <asp:Label ID="L" runat="server" Text="Personal information" Font-Underline="True"></asp:Label>
    <br />
    <br />
    <asp:DetailsView ID="studentData" runat="server" Height="70px" Width="468px" AutoGenerateRows="False" DataKeyNames="StudNum" DataSourceID="SqlDataSource1" OnItemUpdated="studentData_ItemUpdated">
        <Fields>
            <asp:BoundField DataField="StudNum" HeaderText="Student number" ReadOnly="True" SortExpression="StudNum" />
            <asp:BoundField DataField="StudFname" HeaderText="Student name" SortExpression="StudFname" />
            <asp:BoundField DataField="StudLname" HeaderText="Student surname" SortExpression="StudLname" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="CellPhone" HeaderText="Cell No." SortExpression="CellPhone" />
            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
            <asp:CommandField ShowEditButton="True" />
        </Fields>
</asp:DetailsView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Student] WHERE [StudNum] = ?" InsertCommand="INSERT INTO [Student] ([StudNum], [StudFname], [StudLname], [Email], [CellPhone], [Password]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Student] WHERE ([StudNum] = ?)" UpdateCommand="UPDATE [Student] SET [StudFname] = ?, [StudLname] = ?, [Email] = ?, [CellPhone] = ?, [Password] = ? WHERE [StudNum] = ?">
    <DeleteParameters>
        <asp:Parameter Name="StudNum" Type="String" />
    </DeleteParameters>
    <InsertParameters>
        <asp:Parameter Name="StudNum" Type="String" />
        <asp:Parameter Name="StudFname" Type="String" />
        <asp:Parameter Name="StudLname" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="CellPhone" Type="String" />
        <asp:Parameter Name="Password" Type="String" />
    </InsertParameters>
    <SelectParameters>
        <asp:SessionParameter Name="StudNum" SessionField="snum" Type="String" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="StudFname" Type="String" />
        <asp:Parameter Name="StudLname" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="CellPhone" Type="String" />
        <asp:Parameter Name="Password" Type="String" />
        <asp:Parameter Name="StudNum" Type="String" />
    </UpdateParameters>
</asp:SqlDataSource>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Current booking(s)" Font-Underline="True"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="booking" runat="server" AutoGenerateColumns="False" DataKeyNames="TrackingNum" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="booking_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="TrackingNum" HeaderText="TrackingNum" InsertVisible="False" ReadOnly="True" SortExpression="TrackingNum" />
            <asp:BoundField DataField="UnitNum" HeaderText="UnitNum" SortExpression="UnitNum" />
            <asp:BoundField DataField="DateBooked" HeaderText="DateBooked" SortExpression="DateBooked" />
            <asp:CheckBoxField DataField="Paid" HeaderText="Paid" SortExpression="Paid" />
            <asp:BoundField DataField="CheckInDate" HeaderText="CheckInDate" SortExpression="CheckInDate" />
            <asp:BoundField DataField="CheckOutDate" HeaderText="CheckOutDate" SortExpression="CheckOutDate" />
        </Columns>
     </asp:GridView>

     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Booking] WHERE [TrackingNum] = ?" InsertCommand="INSERT INTO [Booking] ([TrackingNum], [UnitNum], [DateBooked], [Paid], [CheckInDate], [CheckOutDate]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [TrackingNum], [UnitNum], [DateBooked], [Paid], [CheckInDate], [CheckOutDate] FROM [Booking] WHERE ([StudNum] = ?)" UpdateCommand="UPDATE [Booking] SET [UnitNum] = ?, [DateBooked] = ?, [Paid] = ?, [CheckInDate] = ?, [CheckOutDate] = ? WHERE [TrackingNum] = ?">
         <DeleteParameters>
             <asp:Parameter Name="TrackingNum" Type="Int32" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="TrackingNum" Type="Int32" />
             <asp:Parameter Name="UnitNum" Type="Int32" />
             <asp:Parameter Name="DateBooked" Type="DateTime" />
             <asp:Parameter Name="Paid" Type="Boolean" />
             <asp:Parameter Name="CheckInDate" Type="DateTime" />
             <asp:Parameter Name="CheckOutDate" Type="DateTime" />
         </InsertParameters>
         <SelectParameters>
             <asp:SessionParameter Name="StudNum" SessionField="snum" Type="String" />
         </SelectParameters>
         <UpdateParameters>
             <asp:Parameter Name="UnitNum" Type="Int32" />
             <asp:Parameter Name="DateBooked" Type="DateTime" />
             <asp:Parameter Name="Paid" Type="Boolean" />
             <asp:Parameter Name="CheckInDate" Type="DateTime" />
             <asp:Parameter Name="CheckOutDate" Type="DateTime" />
             <asp:Parameter Name="TrackingNum" Type="Int32" />
         </UpdateParameters>
     </asp:SqlDataSource>





    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
