using BusinessEntities;
using BusinessServices;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace UniversityAPI.Controllers
{
    [RoutePrefix("api/Departments")]
    public class DepartmentsController : ApiController
    {
        readonly IDepartmentServices deptServices;

        public DepartmentsController()
        {
            this.deptServices = new DepartmentServices();
        }

        // GET: api/Departments
        [Route("")]
        public IEnumerable<DepartmentEntity> GetAllDepartments()
        {
            return deptServices.GetAllDepartments();
        }
    }
}
