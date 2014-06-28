Imports System.Data
Imports System.Data.OleDb

Namespace SCLE.Admin
    Partial Class vCategory
        Inherits System.Web.UI.Page

	#Region " Web Form Designer Generated Code "

        'This call is required by the Web Form Designer.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        End Sub

        Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
            InitializeComponent()
        End Sub

	#End Region

	Private strConnString As String = ConfigurationManager.ConnectionStrings("SQLConnectionString").ConnectionString
	
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
	   	If Not IsPostBack Then
	         BindData()
	   	End If
	End Sub

	Private Sub BindData()
	  Dim strQuery As String = "select PlantID,Plant,CategoryID from vPlant"
	  Dim cmd As New SqlCommand(strQuery)
	  GridView1.DataSource = GetData(cmd)
	  GridView1.DataBind()
	End Sub

End Class
End Namespace


