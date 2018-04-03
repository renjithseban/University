using System.Collections.Generic;

namespace University.Models
{
    public class HomeViewModel
    {
        public List<NewsViewModel> NewsModel { get; set; }

        public List<EventsViewModel> EventModel { get; set; }

        public List<DepartmentViewModel> DepartmentModel { get; set; }
    }
}