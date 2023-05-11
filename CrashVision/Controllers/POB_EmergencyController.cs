using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.SqlClient;

namespace CrashVision.Controllers
{
    public class POB_EmergencyController : Controller
    {
        private IConfiguration Configuration;

        public POB_EmergencyController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        public IActionResult Index()
        {
            DataTable dt = new DataTable();
            String str = this.Configuration.GetConnectionString("MyConnectionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_POB_Emergency_SelectAll";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("Emergency", dt);
        }
    }
}
