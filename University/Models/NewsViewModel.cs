using System;

namespace University.Models
{
    public class NewsViewModel
    {
        public string Title { get; set; }

        public string Abstract { get; set; }

        public DateTime AirDate { get; set; }

        public string ImagePath { get; set; }
    }
}