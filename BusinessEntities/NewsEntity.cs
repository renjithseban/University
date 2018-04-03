using System;

namespace BusinessEntities
{
    public class NewsEntity
    {
        public int NewsId { get; set; }

        public string Title { get; set; }

        public string Abstract { get; set; }

        public string News { get; set; }

        public DateTime AirDate { get; set; }

        public string ImagePath { get; set; }
    }
}
