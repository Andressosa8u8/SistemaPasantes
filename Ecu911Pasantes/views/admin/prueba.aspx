<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/admin.Master" AutoEventWireup="true" CodeBehind="prueba.aspx.cs" Inherits="Ecu911Pasantes.views.admin.prueba" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    PRUEBA
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMensajes" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <div class="page-header">
     <div class="row">
         <div class="col-md-6 col-sm-12">
             <div class="title">
                 <h4>Registrar horas</h4>
             </div>
             <nav aria-label="breadcrumb" role="navigation">
                 <ol class="breadcrumb">
                     <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                     <li class="breadcrumb-item"><a href="horas.aspx">Listado de horas</a></li>
                     <li class="breadcrumb-item active" aria-current="page">Registrar horas</li>
                 </ol>
             </nav>
         </div>
     </div>
 </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
