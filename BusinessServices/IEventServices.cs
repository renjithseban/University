using BusinessEntities;
using System;
using System.Collections.Generic;

namespace BusinessServices
{
    public interface IEventServices : IDisposable
    {
        IEnumerable<EventEntity> GetAllEvents();
    }
}
