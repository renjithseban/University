using BusinessEntities;
using System;
using System.Collections.Generic;

namespace BusinessServices
{
    public interface INewsServices : IDisposable
    {
        IEnumerable<NewsEntity> GetAllNews();
        IEnumerable<NewsEntity> GetLatestNews();
    }
}
