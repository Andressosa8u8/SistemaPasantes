<%@ Page Title="" Language="C#" MasterPageFile="~/views/pasantes/pasante.Master" AutoEventWireup="true" CodeBehind="Acuerdo.aspx.cs" Inherits="Ecu911Pasantes.views.pasantes.Acuerdo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitle" runat="server">
    Acuerdo de Confidencialidad | Pasantes - Sistema Pasantes
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
                                <h4>Acuerdo de confidencialidad</h4>
                            </div>
                            <nav aria-label="breadcrumb" role="navigation">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="inicio.aspx">Inicio</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Acuerdo de confidencialidad</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <div class="invoice-wrap">
                    <div class="invoice-box">
                        <div class="invoice-header">
                            <div class="logo text-left">
                                <img src="../../resources/vendors/images/ECU911.svg.png" width="100" height="100" alt="">
                            </div>
                        </div>
                        <h5 class="text-center mb-30 weight-600" style="font-family: Arial">DECLARACIÓN DE CONFIDENCIALIDAD DE INFORMACIÓN DEL
                            SERVICIO INTEGRADO DE SEGURIDAD ECU 911</h5>
                        <div class="row pb-30">
                            <div class="col-md-12">
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    En la ciudad de <b>Quito</b>,<asp:Label ID="lblFecha" runat="server" Text=""></asp:Label>,yo
                                    <asp:Label ID="lblNombres" runat="server" Text="" Font-Bold="true"></asp:Label>con cédula de identidad No.
                                    <asp:Label ID="lblCedula" runat="server" Text="" Font-Bold="true"></asp:Label>,domiciliado en 
                                    <asp:Label ID="lbldireccion" runat="server" Text="" Font-Bold="true"></asp:Label>,en mi calidad de Estudiante de la Facultad, Escuela o Carrera de
                                    <asp:Label ID="lblCarrera" runat="server" Text="Tecnologia Superior en Desarrollo de Software " Font-Bold="true"></asp:Label>de la Universidad
                                    <asp:Label ID="lblUniversidad" runat="server" Text="Tecnológico Superior Cordillera" Font-Bold="true"></asp:Label>,realizando
                                    <asp:Label ID="lblActividad" runat="server" Text="prácticas " Font-Bold="true"></asp:Label>en el Servicio Integrado de Seguridad ECU 911, área de
                                    <asp:Label ID="lblArea" runat="server" Text="Talento Humano " Font-Bold="true"></asp:Label>que en adelante y para efectos jurídicos del presente instrumento se denominará “EL ESTUDIANTE”, de manera libre y voluntaria, 
                                                en uso de sus capacidades, suscribe la presente declaración de confidencialidad de información,
                                                al tenor de las siguientes cláusulas:  
                                </p>
                            </div>
                            <div class="col-md-12">
                                <h6 style="text-align: start; font-family: Arial">CLÁUSULA PRIMERA.- ANTECEDENTES</h6>
                                <p class="font-14 mb-5" style="text-align: justify">
                                    1.1.- El inciso final del artículo 22 de la Ley Orgánica del Servicio Público, dentro de los deberes de las y los servidores públicos, 
                                                establece: “Custodiar y cuidar la documentación e información que, por razón de su empleo, cargo o comisión tenga bajo su responsabilidad 
                                                e impedir o evitar su uso indebido, sustracción, ocultamiento o inutilización”;
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    1.2.- El artículo 5 de la Ley Orgánica de Transparencia y Acceso a la Información Pública, establece lo siguiente: 
                                                “Se considera información pública, todo documento en cualquier formato, que se encuentre en poder de las instituciones públicas y de 
                                                las personas jurídicas a las que se refiere esta Ley, contenidos, creados u obtenidos por ellas, que se encuentren bajo su responsabilidad 
                                                o se hayan producido con recursos del Estado”;
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    1.3.- El artículo 6 de la Ley ibídem, en relación a la información confidencial, determina: “Se considera información confidencial aquella 
                                                información pública personal, que no está sujeta al principio de publicidad y comprende aquella derivada de sus derechos personalísimos y fundamentales 
                                                (…)”; de igual manera establece en su artículo 17: “De la Información Reservada.- No procede el derecho a acceder a la información pública, 
                                                exclusivamente en los siguientes casos: […] b) Las informaciones expresamente establecidas como reservadas en leyes vigentes”; 
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    1.4.- El Código Orgánico Integral Penal, tipifica en su artículo 179: "Revelación del secreto.- La persona que teniendo conocimiento 
                                                por razón de su estado u oficio, empleo, profesión o arte, de un secreto cuya divulgación pueda causar daño a otra persona y lo revele, 
                                                será sancionada con pena privativa de libertad de seis meses a un año". Por su parte, en el artículo 180 prescribe: "Difusión de información 
                                                de circulación restringida.- la persona que difunda información de circulación restringida será sancionada con pena privativa de libertad de 
                                                uno a tres años (…)";
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    1.5.- El Código Orgánico de Economía Social del Conocimiento, expresa en su artículo 116, que: “Derechos Patrimoniales del Sector Público.- 
                                                La titularidad de los derechos sobre las obras creadas por servidores públicos en el desempeño de sus cargos, corresponderá a los organismos, 
                                                entidades, dependencias del sector público respectivamente (…)”;
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    1.6.- Mediante Decreto Ejecutivo N° 988 de 29 de diciembre de 2011, publicado en el Registro Oficial No. 618 de 13 de enero de 2012, 
                                                el Presidente Constitucional de la República dispone: "Artículo 1.- El presente Decreto Ejecutivo tiene por objeto regular la implementación 
                                                del Servicio Integrado de Seguridad ECU-911, como herramienta tecnológica integradora de los servicios de emergencia que prestan los Cuerpos de Bomberos, 
                                                las Fuerzas Armadas, la Policía Nacional e instituciones que conforman el Sistema Nacional de Salud (…)";
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    1.7.-  La Disposición General del Decreto Ejecutivo N° 031 de 24 de junio de 2013, publicado en el Registro Oficial Suplemento No. 44 de 25 
                                                de julio de 2013, señala: “Concédase al Servicio Integrado de Seguridad ECU-911 la calidad de “Servicio” en los términos de la letra h) del Artículo 10.1 
                                                del Estatuto de Régimen Jurídico y Administrativo de la Función Ejecutiva y, por tanto, personalidad jurídica como organismo público con autonomía administrativa,
                                                operativa y financiera, y jurisdicción nacional, con sede principal en la ciudad de Quito, conformado por centros operativos a nivel nacional”;
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    1.8.- La Resolución Ministerial No. MICS-2013-046 de fecha 9 de septiembre de 2013, se dispone: “Artículo 1.- Clasificar con el carácter de 
                                                reservada toda la información contenida en los manuales, protocolos, procedimientos, metodologías e instructivos generados y que lleguen a generarse 
                                                en el Servicio Integrado de Seguridad ECU 911, como consecuencia o para la prestación del servicio de despacho de recursos para la atención de emergencias, 
                                    video vigilancia y recepción de llamadas a la línea única 911”.
                                </p>
                            </div>
                            <div class="col-md-12">
                                <h6 style="text-align: start; font-family: Arial">CLÁUSULA SEGUNDA.- OBJETO:</h6>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    El objeto de la presente Declaración de confidencialidad de información del SIS ECU 911, es fijar los términos y condiciones 
                                            bajo los que se mantendrá la confidencialidad de toda la información recibida, escuchada, entregada, intercambiada y/o visualizada, 
                                            incluyendo informes, procesos, investigaciones, pronósticos, informes internos, imágenes, audios, entre otros, que “EL ESTUDIANTE” 
                                            tenga conocimiento por cualquier medio en el desarrollo  de actividades en el área de Talento Humano de conformidad con lo dispuesto 
                                            en la Resolución Ministerial No. MICS-2013-046 de fecha 9 de septiembre de 2013.
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    También es objeto de la presente declaración de confidencialidad, expresar de manera libre y voluntaria que la titularidad de los derechos 
                                            sobre las obras creadas en el desarrollo de las actividades a realizarse en el área de la Dirección Nacional de Regulatorio en Emergencias.
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    Para el cumplimiento del objeto de la presente declaración, me comprometo a observar las siguientes directrices:
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    <b class="font-16">a.</b> Conozco que toda información de circulación restringida y la calificada como reservada que se encuentre bajo custodia del Servicio 
                                            Integrado de Seguridad ECU 911, está protegida en el marco de las disposiciones contenidas en la Resolución Ministerial No. MICS-2013-046 de 
                                            9 de septiembre de 2013; y, que me encuentro prohibido de apropiarla, revelarla o divulgarla a terceros directamente o a través de otras personas;
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    <b class="font-16">b.</b> Conozco que el Know How o conocimiento, que se genere en el trabajo del Servicio Integrado de Seguridad ECU 911 desarrollado y producto de la 
                                            información reservada que maneja la entidad, por ningún motivo podrá ser apropiada, revelada o divulgada, así mismo no se podrá reproducir por cualquier 
                                            medio, bases de datos o productos de análisis;
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    <b class="font-16">c.</b> Debo utilizar de manera correcta los bienes institucionales, así como las fuentes de consulta internas y externas de información, mismas que no deben 
                                            ser usadas para beneficio personal y de terceros; y, que sus accesos deberán realizarse conforme lo determinado en los procesos y procedimientos internos 
                                            que rigen a las dos Instituciones del Estado; De igual manera cumpliré en todo momento las normas internas del Servicio Integrado de Seguridad ECU 911, 
                                            sobre la permanencia y uso de las instalaciones;
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    <b class="font-16">d.</b> Declaro que la titularidad y derechos patrimoniales sobre los programas informáticos, script de programación, aplicativos y software en general creados 
                                            en el desarrollo del proyecto, son de propiedad total y exclusiva del Servicio Integrado de Seguridad ECU 911; por lo que a presente y a futuro me abstendré 
                                            de iniciar cualquier tipo de acción legal que procure reclamar algún posible derecho. La Institución reconocerá el derecho moral de los “Estudiantes” en los 
                                            términos del Código Orgánico de la Economía Social de los Conocimientos, la Creatividad y la Innovación, en el desarrollo del Proyecto.
                                </p>
                            </div>
                            <div class="col-md-12">
                                <h6 style="text-align: start">CLÁUSULA TERCERA.- INFORMACIÓN CONFIDENCIAL:</h6>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    Para efectos de la presente declaración se entenderá por “Información Confidencial”, toda clase de datos proporcionados 
                                            en cualquier formato y por cualquier medio, por el SIS ECU 911 al “EL ESTUDIANTE” para el desarrollo del proyecto, en tal 
                                            virtud no podrá difundir, divulgar, ni aprovechar en modo alguno la información sujeta a esta declaración para otro fines, 
                                            cometidos, trabajos o intereses, que los que le son propios a su naturaleza jurídica y administrativa.
                                </p>
                            </div>
                            <div class="col-md-12">
                                <h6 style="text-align: start">CLÁUSULA CUARTA.- EXCEPCIONES:</h6>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    La obligación de confidencial contenida en la presente declaración, no se aplicará cuando “EL ESTUDIANTE” pueda demostrar que:
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    • La información confidencial es, al momento de la revelación, de dominio público o se volvió parte del dominio público 
                                            mediante una publicación o cualquier otro medio distintos a alguna acción que constituya una violación a las disposiciones 
                                            de esta Declaración;
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    • La información confidencial fue desarrollada de forma independiente al Servicio;
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    • La información confidencial sea requerida para ser revelada por una agencia gubernamental o por una corte competente.
                                </p>
                            </div>
                            <div class="col-md-12">
                                <h6 style="text-align: start">CLÁUSULA QUINTA.- VIGENCIA DE LA DECLARACIÓN DE CONFIDENCIALIDAD:</h6>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    “EL ESTUDIANTE” se compromete a cumplir con las obligaciones contenidas en la presente declaración de confidencialidad, 
                                    aún después de dos (2) años de finalizado el proyecto en el Servicio Integrado de Seguridad ECU 911. 
                                </p>
                                <p class="font-14 mb-5" style="text-align: justify; font-family: Arial">
                                    La presente declaración firmada en dos (2) ejemplares rige a partir de la fecha de su suscripción. 
                                </p>
                                <p class="font-14 mb-5" style="text-align: start; font-family: Arial">
                                    Nombre del Estudiante:
                                            <asp:Label ID="lblEstudiante" runat="server" Text=""></asp:Label>
                                </p>
                                <p class="font-14 mb-5" style="text-align: start; font-family: Arial">
                                    Firma del Estudiante: 
                                            <asp:Label ID="lblFirma" runat="server" Text="__________________"></asp:Label>
                                </p>
                                <p class="font-14 mb-5" style="text-align: start; font-family: Arial">
                                    Número de Cédula:     
                                            <asp:Label ID="lblCedulaF" runat="server" Text=""></asp:Label>
                                </p>
                            </div>
                            <div class="col-md-12">
                                <asp:CheckBox ID="ckbAcuerdo" runat="server"
                                    AutoPostBack="True"
                                    Text="Acepto los Terminos y condiciones y el aviso de privacidad"
                                    TextAlign="Right" Checked="false" />
                            </div>
                            <div class="col-md-12 text-right">
                                <asp:Button ID="btnGuardar" CssClass="btn btn-primary" runat="server" OnClick="btnGuardar_Click" Text="Aceptar" />
                            </div>
                        </div>
                    </div>
                </div>
                <br />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphFooter" runat="server">
    <script type="text/javascript" src="../../resources/src/plugins/sweetalert2/sweetalert2.all.js"></script>
    <script type="text/javascript" src="../../resources/src/plugins/sweetalert2/sweet-alert.init.js"></script>
</asp:Content>
