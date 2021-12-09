<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AvailableStorage.aspx.cs" Inherits="UnistoreWeb.AvailableStorage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Avalable storage
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
    University Storage system
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <section id="account-header"><h2>Available Storage</h2></section>


    

    <p>Fitler by</p>
    <table><tr><td>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="cumpusName" DataValueField="cumpusId" Height="30px" Width="160px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [cumpusId], [cumpusName] FROM [Campus]"></asp:SqlDataSource>
        </td><td>
            <asp:DropDownList ID="building" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="BuildName" DataValueField="BuildingNum" Height="30px" Width="160px" OnDataBound="building_DataBound" OnLoad="building_Load" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" OnTextChanged="building_TextChanged">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [CampusID], [BuildingNum], [BuildName] FROM [Building] WHERE ([CampusID] = ?)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="CampusID" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td></tr></table>

    <br />
    <br />


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Width="632px">
        <Columns>
            <asp:BoundField DataField="UnitId" HeaderText="Unit number" InsertVisible="False" SortExpression="UnitId" />
            <asp:BoundField DataField="UnitSize" HeaderText="Unit size" SortExpression="UnitSize" />
            <asp:BoundField DataField="Dimension" HeaderText="Dimension(cm)" SortExpression="Dimension" />
            <asp:BoundField DataField="Fee" HeaderText="Fee(rand)" SortExpression="Fee" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT StorageUnit.UnitId,  StorageUnit.UnitSize, UnitSize.Dimension, UnitSize.Fee FROM (StorageUnit INNER JOIN UnitSize ON StorageUnit.UnitSize = UnitSize.UnitSize) WHERE (StorageUnit.Available = true)"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT StorageUnit.UnitSize, StorageUnit.UnitId, UnitSize.Dimension, UnitSize.Fee FROM (StorageUnit INNER JOIN UnitSize ON StorageUnit.UnitSize = UnitSize.UnitSize) WHERE (StorageUnit.Available = true)">
    </asp:SqlDataSource>

 
    <br />
    <asp:Label ID="noUnit" runat="server" Text="Label"></asp:Label>
    <br />
    <br />

    <a href="TestBooking.aspx">Go to booking</a>

  <%-- <asp:Button ID="Book" runat="server" Text="Go to booking" Height="25px" Width="201px" OnClick="Book_Click" />--%>



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
