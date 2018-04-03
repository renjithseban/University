﻿using System;

namespace University.Models
{
    public class EventsViewModel
    {
        public string Category { get; set; }

        public string Description { get; set; }

        public string Location { get; set; }

        public DateTime StartTime { get; set; }

        public DateTime EndTime { get; set; }

        public string ImagePath { get; set; }
    }
}