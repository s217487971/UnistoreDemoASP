<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TestBooking.aspx.cs" Inherits="UnistoreWeb.TestBooking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    TestBooking
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <section id="account-header"><h2>Booking</h2></section>

  
   
    <section class="b">
        <article id="ar1">


     <div  >
         <%-- Select venue--%>
         <asp:Label ID="Label4" runat="server" Text="Select a vanue" Font-Underline="True"></asp:Label>
    <br />
    <table>
        <tr><td>
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="cumpusName" DataValueField="cumpusId" AutoPostBack="True" Width="150px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT [cumpusId], [cumpusName] FROM [Campus]"></asp:SqlDataSource>
            </td><td>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="BuildName" DataValueField="BuildingNum" AutoPostBack="True" Width="150px" OnDataBound="DropDownList2_DataBound" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged1">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [BuildName], [CampusID], [BuildingNum] FROM [Building] WHERE ([CampusID] = ?)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="CampusID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td> </tr>
    </table>
         <%-- Select unit size--%>
    <br />
         <asp:Label ID="Label3" runat="server" Text="Select a unit" Font-Underline="True"></asp:Label>
    <br />
         <asp:Label ID="noUnit" runat="server" Text=""></asp:Label>
    <asp:GridView ID="units" runat="server" AutoGenerateColumns="False" DataKeyNames="UnitId" DataSourceID="SqlDataSource3" Width="500px" OnSelectedIndexChanged="units_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="UnitId" HeaderText="Unit number" InsertVisible="False" ReadOnly="True" SortExpression="UnitId" />
            <asp:BoundField DataField="UnitSize" HeaderText="Size" SortExpression="UnitSize" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [StorageUnit] WHERE [UnitId] = ?" InsertCommand="INSERT INTO [StorageUnit] ([UnitId], [UnitSize], [BuilNum], [Available]) VALUES (?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [StorageUnit] WHERE ([BuilNum] = ?)" UpdateCommand="UPDATE [StorageUnit] SET [UnitSize] = ?, [BuilNum] = ?, [Available] = ? WHERE [UnitId] = ?">
        <DeleteParameters>
            <asp:Parameter Name="UnitId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="UnitId" Type="Int32" />
            <asp:Parameter Name="UnitSize" Type="String" />
            <asp:Parameter Name="BuilNum" Type="Int32" />
            <asp:Parameter Name="Available" Type="Boolean" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList2" Name="BuilNum" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="UnitSize" Type="String" />
            <asp:Parameter Name="BuilNum" Type="Int32" />
            <asp:Parameter Name="Available" Type="Boolean" />
            <asp:Parameter Name="UnitId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
 
         <asp:Label ID="Label2" runat="server" Text="Add items" Font-Underline="True"></asp:Label>
    <br />
    <table>
        <tr><td>Length</td><td>Width</td><td>Height</td></tr>
        <tr><td>
            <asp:TextBox ID="l" runat="server" Width="150px" TextMode="Number"></asp:TextBox>
            </td><td>
                <asp:TextBox ID="w" runat="server" Width="150px" TextMode="Number"></asp:TextBox>
            </td><td>
                <asp:TextBox ID="h" runat="server" Width="150px" TextMode="Number"></asp:TextBox>
            </td></tr>
        <tr><td>Item description</td><td></td><td></td></tr>
        <tr ><td colspan="3">
            <textarea ID="des" runat="server" rows="2" style="width: 250px"></textarea></tr>
        <tr><td colspan="3">
            <asp:Label ID="errorM" runat="server"></asp:Label></td></tr>
        <tr><td>
            <asp:Button ID="Button1" runat="server" Width="150px" Text="Add item" OnClick="Button1_Click" />
            </td><td></td><td></td></tr>
    </table>
    
         </div>
            <br />
          

        </article>
        <article id="ar2">
            <asp:Label ID="Label5" runat="server" Text="Unit dimensions and prices" Font-Underline="True"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UnitSize" DataSourceID="SqlDataSource4" Height="45px" Width="500px">
            <Columns>
                <asp:BoundField DataField="UnitSize" HeaderText="Size" ReadOnly="True" SortExpression="UnitSize" />
                <asp:BoundField DataField="Dimension" HeaderText="Dimension" SortExpression="Dimension" />
                <asp:BoundField DataField="Fee" HeaderText="Fee" SortExpression="Fee" />
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [UnitSize], [Dimension], [Fee] FROM [UnitSize]"></asp:SqlDataSource>
            <br />
            <asp:Label ID="Label6" runat="server" Text="Current selected unit" Font-Underline="True"></asp:Label>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="SqlDataSource5">
                <Fields>
                    <asp:BoundField DataField="Expr1" HeaderText="Unit No." SortExpression="Expr1" InsertVisible="False" />
                    <asp:BoundField DataField="UnitSize" HeaderText="Size" SortExpression="UnitSize" />
                    <asp:BoundField DataField="Fee" HeaderText="Fee" SortExpression="Fee" />
                    <asp:BoundField DataField="BuildName" HeaderText="Building" SortExpression="BuildName" />
                    <asp:BoundField DataField="cumpusName" HeaderText="Campus" SortExpression="cumpusName" />
                    <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT StorageUnit.UnitId AS Expr1, StorageUnit.UnitSize, UnitSize.Fee, Building.BuildName, Campus.cumpusName, Campus.Address FROM (((StorageUnit INNER JOIN UnitSize ON StorageUnit.UnitSize = UnitSize.UnitSize) INNER JOIN Building ON StorageUnit.BuilNum = Building.BuildingNum) INNER JOIN Campus ON Building.CampusID = Campus.cumpusId) WHERE (StorageUnit.UnitId = ?)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="units" Name="UnitId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:Label ID="remainigV" runat="server" Text=""></asp:Label>

            <br />
            <asp:Label ID="Label7" runat="server" Text="Added items" Font-Underline="True" Font-Bold="False"></asp:Label>
            <br />

            <br />
        <asp:Label ID="full" runat="server"></asp:Label>
              <table class="itemsT" ID="Table1" runat="server">
                  <tr ><th>Number</th><th>Description</th><th>Dimension</th></tr>

        </table>

            <br />

    <table>
        <tr><td colspan="2">
            <asp:Label ID="noItems" runat="server" Text=""></asp:Label></td></tr>
        <tr><td>
            <asp:Label ID="Label1" runat="server" Text="Item No. "></asp:Label>
            <asp:TextBox ID="itemNumber" runat="server" TextMode="Number"></asp:TextBox>
            </td><td>
                <asp:Button ID="Button2" runat="server" Text="Remove item" OnClick="Button2_Click" Width="150px" /></td></tr>
        <tr><td>
        <asp:Button ID="Button3" runat="server" Text="Book" Width="150px" OnClick="Button3_Click" /></td><td>
            <asp:Button ID="Button4" runat="server" Text="Clear" Width="150px" OnClick="Button4_Click" />
                                                                     </td></tr></table>


        </article>

        
        
    </section>

    
   
 
    <div ID="add" runat="server">

    </div>


    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
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
