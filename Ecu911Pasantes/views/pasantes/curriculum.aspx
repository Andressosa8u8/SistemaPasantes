<%@ Page Title="" Language="C#" MasterPageFile="~/views/pasantes/pasante.Master" AutoEventWireup="true" CodeBehind="curriculum.aspx.cs" Inherits="Ecu911Pasantes.views.pasantes.curriculum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Curriculum | Pasantes - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
    <link rel="stylesheet" type="text/css" href="../../resources/src/plugins/sweetalert2/sweetalert2.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphMensajes" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="min-height-200px">
                <div class="page-header">
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <div class="title">
                                <h4>Curriculum</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="#">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Curriculum</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="pd-20 card-box mb-30">
                    <div class="clearfix mb-20">
                        <div class="pull-left">
                            <h4 class="text-blue h4">Subir curriculum vitae</h4>
                        </div>
                    </div>
                    <div class="fallback">
                        <asp:TextBox ID="txtCurriculum" CssClass="form-control" placeholder="Ingrese el link de donde se encuentra alojado su curriculum vitae" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtCurriculum" ForeColor="Red" ValidationGroup="info" runat="server" ErrorMessage="El curriculum es requerido"></asp:RequiredFieldValidator>
                    </div>
                    <div class="text-right">
                        <asp:Button ID="btnSubir" CssClass="btn btn-success" OnClick="btnSubir_Click" ValidationGroup="info" runat="server" Text="Subir" />       
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script type="text/javascript" src="../../resources/src/plugins/sweetalert2/sweetalert2.all.js"></script>
    <script type="text/javascript" src="../../resources/src/plugins/sweetalert2/sweet-alert.init.js"></script>
</asp:Content>
