<%@ Page Title="" Language="C#" MasterPageFile="~/views/pasantes/pasante.Master" AutoEventWireup="true" CodeBehind="Certificado.aspx.cs" Inherits="Ecu911Pasantes.views.pasantes.Certificado" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Certificado de Finalizacion | Pasantes - Sistema Pasantes
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCabecera" runat="server">
    <style>
        .contorno{
            border: solid 1px;
            width: 250px; 
            height: 100px; 
            box-shadow: -10px -10px 1px gray; 
            margin-left: 490px;
        }
        .titulo{
            font-weight:600;
            text-align:center !important;
            margin-bottom: 30px;
        }
    </style>
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
                                <h4>Certificado de Finalización</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Certificado de Finalización</li>
                                </ol>
                            </nav>
                        </div>
                        <div class="col-md-6 col-sm-12 text-right">
                            <asp:Button ID="btnExportar" CssClass="btn btn-info" OnClick="btnExportar_Click" runat="server" Text="Exportar Pdf" />
                        </div>
                    </div>
                </div>
                <div id="dvtext" class="invoice-wrap" runat="server">
                    <div class="invoice-box">
                        <div class="invoice-header">
                            <div class="row pb-30">
                                <div class="col-md-12">
                                    <div class="logo text-left">
                                        <img src="../../resources/vendors/images/Bandera.PNG" />
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="text-right" style="margin-right: 30px;">
                                        <p class="font-14 mb-5">
                                            Quito, 
                                        <asp:Label ID="lblFecha" runat="server"></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <h4 class="titulo">CERTIFICADO</h4>
                        <div class="row pb-30" style="margin-left: 20px; margin-right: 20px">
                            <div class="col-md-12">
                                <p class="font-14 mb-5 mb-15" style="text-align: justify; font-family: Arial;">
                                    El Servicio Integrado de Seguridad ECU 911 entrega el presente Certificado a
                                <asp:Label ID="lblNombre" runat="server" Text="Nicolás Fernando Cabezas Vizcarra " Font-Bold="true"></asp:Label>con cédula de identidad
                                <asp:Label ID="lblCedula" runat="server" Text="1725431397" Font-Bold="true"></asp:Label>estudiante de 
                                <asp:Label ID="lblCarrera" runat="server" Text="Desarrollo de Software" Font-Bold="true"></asp:Label>de 
                                <asp:Label ID="lblUniversidad" runat="server" Text="Tecnologico Superior Cordillera" Font-Bold="true"></asp:Label>, por haber formado parte del Proyecto Académico
                                <asp:Label ID="lblProyectos" runat="server" Text="“Desarrollo del sistema para registro de horas de las y los estudiantes que realizan proyectos académicos en el ECU 911, 
                                    Desarrollo del sistema médico del ECU 911”"
                                    Font-Bold="true"></asp:Label>
                                    con una duración de
                                <asp:Label ID="lblHoras" runat="server" Text="240" Font-Bold="true"></asp:Label>horas, a partir del
                                <asp:Label ID="LblInicio" runat="server" Text="02 de Agosto del 2021"></asp:Label>al
                                <asp:Label ID="lblFin" runat="server" Text="10 de Noviembre del 2021"></asp:Label>
                                </p>
                            </div>
                            <div class="col-md-12">
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial;">Durante este periodo demostró su colaboración y responsabilidad en lo encomendado.</p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial;">
                                    Es todo cuanto se puede declarar en honor a la verdad. El interesado puede hacer uso del presente certificado
                                    para los fines pertinentes.
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial;">Se expide el presente certificado para los fines pertinentes.</p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial;">Atentamente,</p>
                            </div>
                            <div class="col-md-12">
                                <img src="../../resources/vendors/images/firmas.png" />
                            </div>
                        </div>
                        <div class="row pb-30">
                            <div class="col-md-12">
                                <div class="align-content-end contorno">
                                    <p class="font-14 mb-5 mb-15" style="text-align: justify; font-family: Arial;">
                                        <label style="text-align: center; font-size: 11px">
                                            Dirección Nacional Académico para Emergencias Subdirección Técnica de Doctrina<br />
                                            Fecha:
                                    <asp:Label ID="lblFecha2" runat="server" Font-Bold="true"></asp:Label><br />
                                            <asp:Label ID="lblCodigo" runat="server" Font-Bold="true" Text="UIO-DNAE-VIN-0323-R "></asp:Label>
                                        </label>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="row pb-30">
                            <div class="col-md-12">
                                <img src="../../resources/vendors/images/footer.png" />
                            </div>
                        </div>
                    </div>
                </div>
                <br />            
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExportar"/>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
</asp:Content>
