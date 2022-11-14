using IAExam.DbLayer;
using IAExam.Models;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System;
using System.Data.SqlClient;

namespace IAExam.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StudentApplicationController : ControllerBase
    {
        private StudentApplicationDB _studentApplicationDB;
        private StudentGrimoireDB _studentGrimoireDB;

        public StudentApplicationController(IConfiguration configuration)
        {
            _studentApplicationDB = new StudentApplicationDB(configuration.GetConnectionString("examIA"));
            _studentGrimoireDB = new StudentGrimoireDB(configuration.GetConnectionString("examIA"));
        }

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
