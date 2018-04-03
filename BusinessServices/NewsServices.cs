using BusinessEntities;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BusinessServices
{
    public class NewsServices : INewsServices
    {
        private readonly NewsRepository newsRepository;
        private UniversityEntities context = new UniversityEntities();

        public NewsServices()
        {
            newsRepository = new NewsRepository(context);
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    newsRepository.Dispose();
                }
            }
            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public IEnumerable<NewsEntity> GetAllNews()
        {
            var newsList = newsRepository.Get();
            List<NewsEntity> newsEntities = null;
            if (newsList != null)
            {
                newsEntities = new List<NewsEntity>();
                foreach (var item in newsList)
                {
                    NewsEntity entity = new NewsEntity();
                    entity.NewsId = item.NewsId;
                    entity.Title = item.Title;
                    entity.Abstract = item.Abstract;
                    entity.News = item.News1;
                    entity.AirDate = item.AirDate;
                    entity.ImagePath = item.ImagePath;
                    newsEntities.Add(entity);
                }
            }
            return newsEntities;
        }

        public IEnumerable<NewsEntity> GetLatestNews()
        {
            var newsList = newsRepository.Get();
            List<NewsEntity> newsEntities = null;
            if (newsList != null)
            {
                newsEntities = new List<NewsEntity>();
                foreach (var item in newsList)
                {
                    NewsEntity entity = new NewsEntity();
                    entity.NewsId = item.NewsId;
                    entity.Title = item.Title;
                    entity.Abstract = item.Abstract;
                    entity.News = item.News1;
                    entity.AirDate = item.AirDate;
                    entity.ImagePath = item.ImagePath;
                    newsEntities.Add(entity);
                }
                return newsEntities.OrderByDescending(n => n.AirDate).Take(6);
            }
            return null;
        }
    }
}
