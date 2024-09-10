<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="recuperar.aspx.cs" Inherits="Ecu911Pasantes.autentificación.recuperar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Recuperar contraseña | Sistema Pasantes</title>
    <!-- Site favicon -->
    <link rel="apple-touch-icon" sizes="180x180" href="../../resources/vendors/images/ECU911.svg.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="../../resources/vendors/images/ECU911.svg.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="../../resources/vendors/images/ECU911.svg.png" />
    <!-- Mobile Specific Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="../resources/vendors/styles/core.css" />
    <link rel="stylesheet" type="text/css" href="../resources/vendors/styles/icon-font.min.css" />
    <link rel="stylesheet" type="text/css" href="../resources/vendors/styles/style.css" />
    <link rel="stylesheet" type="text/css" href="../resources/src/plugins/sweetalert2/sweetalert2.css" />
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async="async" src="https://www.googletagmanager.com/gtag/js?id=UA-119386393-1"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());

        gtag('config', 'UA-119386393-1');
    </script>
</head>
<body>
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" Interval="3000" OnTick="Timer1_Tick"></asp:Timer>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="login-header box-shadow">
                    <div class="container-fluid d-flex justify-content-between align-items-center">
                        <div class="brand-logo">
                            <a href="index.aspx">
                                <img src="../../resources/vendors/images/ECU911.svg.png" width="100" height="100" alt="" />
                            </a>
                        </div>
                        <div class="login-menu">
                            <ul>
                                <li><a href="index.aspx">Acceso</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-md-6">
                                <img src="../resources/vendors/images/forgot-password.png" alt="" />
                            </div>
                            <div class="col-md-6">
                                <div class="login-box bg-white box-shadow border-radius-10">
                                    <div class="login-title">
                                        <h2 class="text-center text-primary">Has olvidado tu contraseña</h2>
                                    </div>
                                    <h6 class="mb-20">Ingrese su correo electrónico para restablecer su contraseña</h6>
                                    <div class="input-group custom">
                                        <asp:TextBox ID="txtEmail" autocomplete="off" CssClass="form-control form-control-lg" type="email" required="required" placeholder="Correo electrónico" runat="server"></asp:TextBox>
                                        <div class="input-group-append custom">
                                            <span class="input-group-text"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
                                        </div>
                                    </div>
                                    <div class="row align-items-center">
                                        <div class="col-5">
                                            <div class="input-group mb-0">
                                                <asp:Button ID="btnEnviar" OnClick="btnEnviar_Click" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="Enviar" />
                                            </div>
                                        </div>
                                        <div class="col-2">
                                            <div class="font-16 weight-600 text-center" data-color="#707373">O</div>
                                        </div>
                                        <div class="col-5">
                                            <div class="input-group mb-0">
                                                <a class="btn btn-outline-primary btn-lg btn-block" href="index.aspx">Acceso</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <!-- js -->
    <script src="../resources/vendors/scripts/core.js"></script>
    <script src="../resources/vendors/scripts/script.min.js"></script>
    <script src="../resources/vendors/scripts/process.js"></script>
    <script src="../resources/vendors/scripts/layout-settings.js"></script>
    <script type="text/javascript" src="../resources/src/plugins/sweetalert2/sweetalert2.all.js"></script>
    <script type="text/javascript" src="../resources/src/plugins/sweetalert2/sweet-alert.init.js"></script>
</body>
</html>
