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
    [RoutePrefix("api/Home")]
    public class HomeController : ApiController
    {
        readonly IDepartmentServices deptServices;
        readonly IEventServices eventServices;
        readonly INewsServices newsServices;

        public HomeController()
        {
            this.deptServices = new DepartmentServices();
            this.eventServices = new EventServices();
            this.newsServices = new NewsServices();
        }

        // GET: api/Departments
        [Route("")]
        public HomeEntity Get()
        {
            HomeEntity entity = new HomeEntity();
            entity.News = newsServices.GetLatestNews();
            entity.Events = eventServices.GetAllEvents();
            entity.Departments = deptServices.GetAllDepartments();
            return entity;
        }
    }
}
