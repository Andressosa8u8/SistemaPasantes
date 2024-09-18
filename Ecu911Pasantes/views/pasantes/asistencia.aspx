<%@ Page Title="" Language="C#" MasterPageFile="~/views/pasantes/pasante.Master" AutoEventWireup="true" CodeBehind="asistencia.aspx.cs" Inherits="Ecu911Pasantes.views.pasantes.asistencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Asistencia | Pasantes - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
    <link href="../../resources/vendors/styles/asistencia.css" rel="stylesheet">
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
                                <h4>Registrar asistencias</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Registrar asistencias</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div id="container" class="container">
                    <h2>ASISTENCIA</h2>
                    <p>Ingresa tu ID de asistencia</p>
                    <asp:TextBox ID="txtAsistencia" type="text" placeholder="ID de asistencia" required="required" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:TextBox ID="txtActividades" Visible="false" Rows="3" TextMode="MultiLine" CssClass="actividades" type="text" placeholder="Ingrese sus actividades" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnAsistencia" OnClick="btnAsistencia_Click" CssClass="registar" runat="server" Text="Registrar" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script type="text/javascript" src="../../resources/src/plugins/sweetalert2/sweetalert2.all.js"></script>
    <script type="text/javascript" src="../../resources/src/plugins/sweetalert2/sweet-alert.init.js"></script>
</asp:Content>
