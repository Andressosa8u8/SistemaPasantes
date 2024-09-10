<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Ecu911Pasantes.autentificación.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Inicio de Sesión | Sistema Pasantes</title>
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
<body class="login-page">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:Timer ID="Timer1" runat="server" Interval="2000" OnTick="Timer1_Tick"></asp:Timer>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div class="login-header box-shadow">
                    <div class="container-fluid d-flex justify-content-between align-items-center">
                        <div class="brand-logo">
                            <a href="index.aspx">
                                <img src="../../resources/vendors/images/ECU911.svg.png" width="100" height="100" alt="" />
                            </a>
                        </div>
                    </div>
                </div>
                <div class="login-wrap d-flex align-items-center flex-wrap justify-content-center">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-md-6 col-lg-7">
                                <img src="../resources/vendors/images/login-page-img.png" alt="" />
                            </div>
                            <div class="col-md-6 col-lg-5">
                                <div class="login-box bg-white box-shadow border-radius-10">
                                    <div class="login-title">
                                        <h2 class="text-center text-primary">Iniciar sesión en Sistema pasantes</h2>
                                    </div>
                                    <div class="input-group custom">
                                        <asp:TextBox ID="txtUser" CssClass="form-control form-control-lg" autocomplete="off" type="text" required="" placeholder="Nombre de usuario" runat="server"></asp:TextBox>
                                        <div class="input-group-append custom">
                                            <span class="input-group-text"><i class="icon-copy dw dw-user1"></i></span>
                                        </div>                      
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="El nombre de usuario es requerido" ControlToValidate="txtUser" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                    <div class="input-group custom">
                                        <asp:TextBox ID="txtPass" CssClass="form-control form-control-lg" type="password" required="" placeholder="**********" runat="server"></asp:TextBox>
                                        <div class="input-group-append custom">
                                            <span class="input-group-text"><i class="dw dw-padlock1"></i></span>
                                        </div>
                                    </div>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ErrorMessage="La contraseña es requerida" ControlToValidate="txtPass" ValidationGroup="Info"></asp:RequiredFieldValidator>
                                    <div class="row pb-30">
                                        <div class="col-6">
                                            <div class="custom-control custom-checkbox">
                                                <input type="checkbox" class="custom-control-input" id="customCheck1" />
                                                <label class="custom-control-label" for="customCheck1">Recordar</label>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="forgot-password"><a href="recuperar.aspx">Has olvidado tu contraseña</a></div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="input-group mb-0">
                                                <asp:Button ID="btnIngresar" OnClick="btnIngresar_Click" CssClass="btn btn-primary btn-lg btn-block" ValidationGroup="Info" runat="server" Text="Iniciar Sesión" />
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
