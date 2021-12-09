<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Cancellations.aspx.cs" Inherits="UnistoreWeb.Cancellations" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <section id="account-header"><h2>Cancellations</h2></section>
    <section>
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
   

    <table><tr><td> <asp:Button ID="Button2" runat="server" Text="Approve All Cancellations" Height="25px" Width="200px" OnClick="Button5123_Click"/></td></tr></table>
        
    <asp:Button CssClass="back" ID="Button3" runat="server" Text="Back" Height="25px" OnClick="Button3_Click" Width="160px" />
    <br />
    <br />
    <asp:GridView CssClass="mygridview" ID="Bookings" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" DataKeyNames="Tracking Number">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Tracking Number" HeaderText="Tracking Number" InsertVisible="False" SortExpression="Tracking Number" ReadOnly="True" />
            <asp:BoundField DataField="Unit Number" HeaderText="Unit Number" SortExpression="Unit Number" />
            <asp:BoundField DataField="Student Number" HeaderText="Student Number" SortExpression="Student Number" />
            <asp:CheckBoxField DataField="Approved State" HeaderText="Approved State" SortExpression="Approved State" />
        </Columns>
    </asp:GridView>
    


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [TrackingNum] AS [Tracking Number], [UnitNum] AS [Unit Number], [StudNum] As [Student Number], [Approved] AS [Approved State] FROM [Booking] WHERE (([Cancelled] = ?) AND ([Approved] = ?))">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="Cancelled" Type="Boolean" />
            <asp:Parameter DefaultValue="false" Name="Approved" Type="Boolean" />
        </SelectParameters>
          </asp:SqlDataSource>
    
    </section>
    <style>
        .check table,tr,td {
           text-align:center;
           padding:10px;           
        }
        .box {
            width:40px;
            height:30px;
        }

        .mygridview {
            width: 90%;
            border: solid 7px black;
            min-width: 100%;
            border-collapse: collapse;
            border-radius: 5px;
            border-style: hidden; /* hide standard table (collapsed) border */
            box-shadow: 0 0 0 3px black; /* this draws the table border  */ 
        }
        .mygridview td {
}
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
