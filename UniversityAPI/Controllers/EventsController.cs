using BusinessEntities;
using BusinessServices;
using System.Collections.Generic;
using System.Web.Http;

namespace UniversityAPI.Controllers
{
    [RoutePrefix("api/Events")]
    public class EventsController : ApiController
    {
        readonly IEventServices eventServices;

        public EventsController()
        {
            this.eventServices = new EventServices();
        }

        // GET: api/Events
        [Route("")]
        public IEnumerable<EventEntity> GetAllEvents()
        {
            return eventServices.GetAllEvents();
        }
    }
}
