using BusinessEntities;
using DataAccess;
using System;
using System.Collections.Generic;

namespace BusinessServices
{
    public class EventServices : IEventServices
    {
        private readonly EventRepository eventRepository;
        private UniversityEntities context = new UniversityEntities();

        public EventServices()
        {
            eventRepository = new EventRepository(context);
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    eventRepository.Dispose();
                }
            }
            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public IEnumerable<EventEntity> GetAllEvents()
        {
            var eventsList = eventRepository.Get();
            List<EventEntity> eventsEntities = null;
            if (eventsList != null)
            {
                eventsEntities = new List<EventEntity>();
                foreach (var item in eventsList)
                {
                    EventEntity entity = new EventEntity();
                    entity.EventId = item.EventId;
                    entity.Category = item.Category;
                    entity.Description = item.Description;
                    entity.Location = item.Location;
                    entity.StartTime = item.StartDateTime;
                    entity.EndTime = item.EndDateTime;
                    entity.ImagePath = item.ImagePath;
                    eventsEntities.Add(entity);
                }
            }
            return eventsEntities;
        }
    }
}
