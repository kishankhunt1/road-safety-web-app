using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;
using CrashVision.Models;

namespace CrashVision.Controllers
{


    public class POB_AccidentController : Controller
    {
        private IConfiguration Configuration;
        public POB_AccidentController(IConfiguration _configuration)
        {
            Configuration = _configuration;
        }

        #region SelectAll
        public IActionResult Index()
        {
            DataTable dt = new DataTable();
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_POB_Accident_SelectAll";
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            return View("POB_AccidentList", dt);
        }
        #endregion

        #region Delete
        public IActionResult Delete(int AccidentID)
        {
            DataTable dt = new DataTable();
            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "PR_POB_Accident_DeleteByPK";
            cmd.Parameters.AddWithValue("@AccidentID", AccidentID);
            cmd.ExecuteNonQuery();
            conn.Close();
            return RedirectToAction("Index");
        }
        #endregion

        #region BTN_AddAccident
        public IActionResult Add(int AccidentID)
        {
            if (AccidentID != null)
            {
                string str = this.Configuration.GetConnectionString("myConnectionString");
                SqlConnection conn = new SqlConnection(str);
                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "PR_POB_Accident_SelectByPK";
                cmd.Parameters.Add("@AccidentID", SqlDbType.Int).Value = AccidentID;
                DataTable dt = new DataTable();
                SqlDataReader AccidentDataByID = cmd.ExecuteReader();
                dt.Load(AccidentDataByID);

                POB_AccidentModel modelPOB_Accident = new POB_AccidentModel();

                foreach (DataRow dr in dt.Rows)
                {
                    modelPOB_Accident.AccidentID = Convert.ToInt32(dr["AccidentID"]);
                    modelPOB_Accident.VehicleImage = dr["VehicleImage"].ToString();
                    modelPOB_Accident.NumberPlate = dr["NumberPlate"].ToString();
                    modelPOB_Accident.VictimName = dr["VictimName"].ToString();
                    modelPOB_Accident.Latitude = dr["Latitude"].ToString();
                    modelPOB_Accident.Longitude = dr["Longitude"].ToString();
                    modelPOB_Accident.AccidentDateTime = Convert.ToDateTime(dr["AccidentDateTime"]);

                }
                return View("POB_AccidentAddEdit", modelPOB_Accident);

            }

            return View("POB_AccidentAddEdit");
        }
        #endregion

        #region Save
        [HttpPost]
        public IActionResult Save(POB_AccidentModel modelPOB_Accident)
        {
            //Upload starts here
            if (modelPOB_Accident.File != null)
            {
                string FilePath = "wwwroot\\Upload";
                string path = Path.Combine(Directory.GetCurrentDirectory(), FilePath);
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                string fileNameWithPath = Path.Combine(path, modelPOB_Accident.File.FileName);
                modelPOB_Accident.VehicleImage = "~" + FilePath.Replace("wwwroot\\", "/") + "/" + modelPOB_Accident.File.FileName;
                using (var stream = new FileStream(fileNameWithPath, FileMode.Create))
                {
                    modelPOB_Accident.File.CopyTo(stream);
                }
            }


            string str = this.Configuration.GetConnectionString("myConnectionString");
            SqlConnection conn = new SqlConnection(str);
            conn.Open();

            //SQL Command to retrieve Country List 
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;

            if (modelPOB_Accident.AccidentID == null)
            {
                cmd.CommandText = "PR_POB_Accident_Insert";
                cmd.Parameters.Add("@AccidentDateTime", SqlDbType.Date).Value = modelPOB_Accident.AccidentDateTime;
            }
            else
            {
                cmd.CommandText = "PR_POB_Accident_UpdateByPK";
                cmd.Parameters.Add("@AccidentID", SqlDbType.Int).Value = modelPOB_Accident.AccidentID;
            }
            cmd.Parameters.Add("@VehicleImage", SqlDbType.NVarChar).Value = modelPOB_Accident.VehicleImage;
            cmd.Parameters.Add("@NumberPlate", SqlDbType.NVarChar).Value = modelPOB_Accident.NumberPlate;
            cmd.Parameters.Add("@VictimName", SqlDbType.NVarChar).Value = modelPOB_Accident.VictimName;
            cmd.Parameters.Add("@Latitude", SqlDbType.NVarChar).Value = modelPOB_Accident.Latitude;
            cmd.Parameters.Add("@Longitude", SqlDbType.NVarChar).Value = modelPOB_Accident.Longitude;

            cmd.ExecuteNonQuery();
            conn.Close();

            return RedirectToAction("Index");
        }
        #endregion
    }
}
