<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CheckIn.aspx.cs" Inherits="UnistoreWeb.CheckIn" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    Check in
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

   <section id="account-header"><h2>check in</h2></section>
    <div>
        <asp:TextBox ID="trNum" runat="server"></asp:TextBox>
        <asp:Button ID="search" runat="server" Text="SEARCH" OnClick="search_Click" /> 
        <asp:Button CssClass="back" ID="Button3" runat="server" Text="Back" Height="25px"  Width="160px" OnClick="Button3_Click" />

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

       </div>
    <br />
    <br />
    <asp:Label runat="server" ID="noting" ForeColor="Red"></asp:Label>
    <section class="container" id="hide" runat="server" style="margin-bottom:30px">
        <article id="left">
            <br />
        
            Item dimensions:
            <br />
            <table class="check">
                <tr>
                    <td>length</td>
                    <td>width</td>
                    <td>height</td>
                </tr>
                <tr>
            <td><asp:TextBox TextMode="Number" ID="uLength" CssClass="box" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox TextMode="Number" ID="uWidth" CssClass="box" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox TextMode="Number" ID="uHeight" CssClass="box" runat="server"></asp:TextBox></td>

                    </tr>
            </table>

            <br />
            Item description:
            <br />
    <br />
    <textarea ID="desc" runat="server" cols="40" rows="6"></textarea>
    <br />
    <asp:Button ID="add" runat="server" Text="Add Item" OnClick="add_Click" />
            <asp:Label runat="server" ForeColor="Red" ID="enterDimen" Visible="false" ></asp:Label>
             <br />
            <br />
            <br />
          
           
            <asp:Button ID="checkIn" runat="server" Text="Check-In" OnClick="checkIn_Click" />
        </article>
        <article id="right">
            <br />
            Unit dimensions(LxWxH) in meters:    
            <asp:Label runat="server" ID="dimen"></asp:Label>
            <br />
            <br />
                        <asp:GridView ID="GridView1" CssClass="mygridview" PagerStyle-CssClass="pgr" runat="server" Width="468px" DataKeyNames="ItemID" AutoGenerateColumns="False" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    
                    <asp:BoundField DataField="ItemID" HeaderText="Item number" ReadOnly="true" />
                    <asp:TemplateField HeaderText="Decription">
                        <EditItemTemplate>
                            <asp:TextBox ID="Label1T" runat="server" Text='<%# Eval("Description") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Dimension" HeaderText="Dimension" ReadOnly="true" />
                    <asp:TemplateField HeaderText="Checked in" ItemStyle-HorizontalAlign="Center">
                        <EditItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Checkedin") %>' />
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Checkedin") %>' Enabled="false" />
                        </ItemTemplate>
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:RadioButton ID="paid" runat="server" Text="Paid" />
        </article>
    </section>
    <asp:Label runat="server" ID="checkSuc"></asp:Label>

    <style>
        .check table,tr,td {
           text-align:center;
           padding:10px;           
        }
        .box {
            width:40px;
            height:30px;
        }
        .border {
            border: solid 3px black;
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
