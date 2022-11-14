using IAExam.DbLayer;
using IAExam.Models;
using Microsoft.AspNetCore.Mvc;

namespace IAExam.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StudentApplicationController : ControllerBase
    {
        private StudentApplicationDB _studentApplicationDB;
        private StudentGrimoireDB _studentGrimoireDB;

        /// <summary>
        /// Receives the configuration in order to access db connection string
        /// </summary>
        /// <param name="configuration"></param>
        public StudentApplicationController(IConfiguration configuration)
        {
            _studentApplicationDB = new StudentApplicationDB(configuration.GetConnectionString("examIA"));
            _studentGrimoireDB = new StudentGrimoireDB(configuration.GetConnectionString("examIA"));
        }

        /// <summary>
        /// Gets a list of the active applications
        /// </summary>
        /// <returns>List of active applications</returns>
        [HttpGet("GetApplications")]
        public IActionResult Get()
        {
            try
            {
                return Ok(_studentApplicationDB.GetApplications());
            }
            catch
            {
                return StatusCode(500);
            }
        }

        /// <summary>
        /// Gets a list of the Grimoire assignations
        /// </summary>
        /// <returns>List of grimoire assignations</returns>
        [HttpGet("GetGrimoireAssignations")]
        public IActionResult GetGrimories()
        {
            try
            {
                return Ok(_studentGrimoireDB.GetGrimoireAssignment());
            }
            catch
            {
                return StatusCode(500);
            }
        }

        /// <summary>
        /// Receives a student to create both the student and the student's application
        /// </summary>
        /// <param name="student"></param>
        /// <returns>Application Created Response</returns>
        [HttpPost]
        public IActionResult CreateApplication(Student student)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest();
                }

                var application = _studentApplicationDB.SaveStudentApplication(student);

                return CreatedAtAction(nameof(Get), new { id = application.Id }, application);
            }
            catch
            {
                return StatusCode(500);
            }
        }

        /// <summary>
        /// Updates a student application based on its id
        /// </summary>
        /// <param name="application"></param>
        /// <returns>Modified student application</returns>
        [HttpPut]
        public IActionResult UpdateApplication(StudentApplication application)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return BadRequest();
                }

                var newApplication = _studentApplicationDB.UpdateStudentAplication(application);

                return Ok(new { id = newApplication.Id, student = new { id = newApplication.Student.StudentId }, applicationStatus = newApplication.ApplicationStatus });
            }
            catch
            {
                return StatusCode(500);
            }
        }

        /// <summary>
        /// Updates the application status based on parameters.
        /// If it's updated to accepted application, it assigns a random grimoire
        /// </summary>
        /// <param name="id"></param>
        /// <param name="newStatusId"></param>
        /// <returns>Application status change or the Grimoire assignation</returns>
        [HttpPut("{id}/{newStatusId}")]
        public IActionResult UpdateApplicationStatus(int id, int newStatusId)
        {
            try
            {
                var newApplication = _studentApplicationDB.UpdateStudentAplicationStatus(id, newStatusId);
                if(newStatusId != 2)
                {
                    return Ok(new { id = newApplication.Id, status = newApplication.ApplicationStatus });
                }

                var grimoires = _studentGrimoireDB.GetGrimoires().ToList();
                var randomIndex = new Random().Next(grimoires.Count);

                var grimoireAssignation = _studentGrimoireDB.AssignGrimoire(newApplication.Student.StudentId, grimoires[randomIndex].Id);

                return Ok(grimoireAssignation);
            }
            catch
            {
                return StatusCode(500);
            }
        }

        /// <summary>
        /// Deletes an application based on an id
        /// </summary>
        /// <param name="id"></param>
        /// <returns>Updated application</returns>
        [HttpDelete("{id}")]
        public IActionResult DeleteAplication(int id)
        {
            try
            {
                var newApplication = _studentApplicationDB.DeleteStudentApplication(id);

                return Ok(newApplication);
            }
            catch
            {
                return StatusCode(500);
            }
        }
    }
}
