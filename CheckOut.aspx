<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="UnistoreWeb.CheckOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Check out
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="header" runat="server">
     University Storage System
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
     <div id="left-menu">
                  <ul>
                <li><a href="Accounts.aspx">Accounts</a></li>
                <li><a href="AllBookings.aspx">Bookings</a></li>
                <li><a href="Storage.aspx">Storage</a></li>
                <li><a href="CheckIn.aspx">Check In</a></li>
                <li><a href="CheckOut.aspx">Check Out</a></li>
            </ul>
           </div>

   <section id="account-header"><h2>Check out</h2></section>

    <div>
        <asp:Button CssClass="back" ID="Button3" runat="server" Text="Back" Height="25px"  Width="160px" OnClick="Button3_Click" />
        <asp:TextBox ID="trNum" runat="server"></asp:TextBox>
        <asp:Button ID="search" runat="server" Text="SEARCH" OnClick="search_Click" />   

    </div>
    <div runat="server" id="info">
                 Tracking number:
    
         <asp:Label ID="trackingNum" runat="server" Text=""></asp:Label>
        
        <br />
         Name:
         <asp:Label ID="name" runat="server" Text=""></asp:Label>
 
    <br />
         Student number:
            
         <asp:Label ID="studNum" runat="server" Text=""></asp:Label>
            <br />
            <br />
    </div>

    <br />
    
    <asp:Label runat="server" ID="noting" ForeColor="Red"></asp:Label>
    &nbsp;<section id="hide" runat="server" class="container" style="margin-bottom:30px">
        <br />
        <br />
        
        <article id="left">    
            <asp:Button ID="checkIn" runat="server" Text="Check-Out" OnClick="checkIn_Click" />
        </article>
        <article id="right">
            <asp:GridView ID="GridView1" CssClass="mygridview" runat="server" Width="468px" DataKeyNames="ItemID" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="ItemID" HeaderText="Item number" ReadOnly="true" />
                    <asp:BoundField DataField="Description" HeaderText="Decription" ReadOnly="true" />
                    <asp:BoundField DataField="Dimension" HeaderText="Dimension" ReadOnly="true" />
                    <asp:TemplateField HeaderText="Check-Out">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("CheckedOut") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("CheckedOut") %>' Enabled="false" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                </Columns>
            </asp:GridView>
        </article>
    </section>
                <br />
            <asp:Label runat="server" ID="checkSuc"></asp:Label>
    <div runat="server" id="cdsssd">
        </div>

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
    </style>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
