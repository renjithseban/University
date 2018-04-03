using BusinessEntities;
using BusinessServices;
using System.Collections.Generic;
using System.Web.Http;

namespace UniversityAPI.Controllers
{
    [RoutePrefix("api/News")]
    public class NewsController : ApiController
    {
        readonly INewsServices newsServices;

        public NewsController()
        {
            this.newsServices = new NewsServices();
        }

        // GET: api/News
        [Route("")]
        public IEnumerable<NewsEntity> GetAllNews()
        {
            return newsServices.GetAllNews();
        }


        // GET: api/News/Latest
        [Route("Latest")]
        public IEnumerable<NewsEntity> GetLatestNews()
        {
            return newsServices.GetLatestNews();
        }
    }
}
