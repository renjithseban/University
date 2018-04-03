using BusinessEntities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Mvc;
using University.Models;

namespace University.Controllers
{
    public class HomeController : Controller
    {
        HttpClient client;
        string url = ConfigurationManager.AppSettings["DefaultAPIUri"].ToString();

        public HomeController()
        {
            client = new HttpClient();
            client.BaseAddress = new Uri(url);
            client.DefaultRequestHeaders.Accept.Clear();
            //client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
        }
        public async Task<ActionResult> Index()
        {
            HomeViewModel homeViewModel = new HomeViewModel();
            HttpResponseMessage newsResponseMessage = await client.GetAsync(url + "Home");
            if (newsResponseMessage.IsSuccessStatusCode)
            {
                var responseData = newsResponseMessage.Content.ReadAsStringAsync().Result;
                var homeEntity = JsonConvert.DeserializeObject<HomeEntity>(responseData);
                List<NewsViewModel> newsViewModels = new List<NewsViewModel>();
                foreach (var item in homeEntity.News)
                {
                    NewsViewModel model = new NewsViewModel();
                    model.Title = item.Title;
                    model.Abstract = item.Abstract;
                    model.AirDate = item.AirDate;
                    model.ImagePath = item.ImagePath;
                    newsViewModels.Add(model);
                }
                homeViewModel.NewsModel = newsViewModels;
                List<EventsViewModel> eventsViewModels = new List<EventsViewModel>();
                foreach (var item in homeEntity.Events)
                {
                    EventsViewModel model = new EventsViewModel();
                    model.Category = item.Category;
                    model.Description = item.Description;
                    model.Location = item.Location;
                    model.StartTime = item.StartTime;
                    model.EndTime = item.EndTime;
                    model.ImagePath = item.ImagePath;

                    eventsViewModels.Add(model);
                }
                homeViewModel.EventModel = eventsViewModels;
                int count = 0;
                List<DepartmentViewModel> deptViewModels = new List<DepartmentViewModel>();
                foreach (var item in homeEntity.Departments)
                {
                    DepartmentViewModel model = new DepartmentViewModel();
                    model.DepartmentName = item.DepartmentName;
                    model.DepartmentDescription = item.Description;
                    model.Counter = count++;

                    deptViewModels.Add(model);
                }
                homeViewModel.DepartmentModel = deptViewModels;
            }
            return View(homeViewModel);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}