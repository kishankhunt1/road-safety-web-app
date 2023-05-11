using System.ComponentModel.DataAnnotations;
using System.ComponentModel;

namespace CrashVision.Models
{
    public class POB_AccidentModel
    {
        [Required]
        public int? AccidentID { get; set; }
        [Required]
        public string? VictimName { get; set; }
        [Required]
        public string NumberPlate { get; set; }
        [Required]
        public IFormFile? File { get; set; }
        [Required]
        public string VehicleImage { get; set; }
        [Required]
        public string Latitude { get; set; }
        [Required]
        public string Longitude { get; set; }
        [Required]
        public DateTime AccidentDateTime { get; set; }
    }
}