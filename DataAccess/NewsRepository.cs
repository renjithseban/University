using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace DataAccess
{
    public class NewsRepository
    {
        private UniversityEntities context;
        private DbSet<News> dbSet;

        public NewsRepository(UniversityEntities context)
        {
            this.context = context;
            this.dbSet = context.Set<News>();
        }

        public void Add(News news)
        {
            try
            {
                if (news != null)
                {
                    News newEntity = dbSet.Add(news);
                    dbSet.Attach(newEntity);
                    context.Entry(newEntity).State = EntityState.Added;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IEnumerable<News> Get()
        {
            try
            {
                IQueryable<News> query = dbSet;
                return query.ToList();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IEnumerable<News> GetMany(Func<News, bool> where)
        {
            try
            {
                if (where != null)
                    return dbSet.Where(where).ToList();
                return null;
            }
            catch (Exception)
            {
                return null;
            }
        }

        #region private dispose variable declaration...
        private bool disposed = false;
        #endregion

        /// <summary>
        /// Protected Virtual Dispose method
        /// </summary>
        /// <param name="disposing"></param>
        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            this.disposed = true;
        }

        /// <summary>
        /// Dispose method
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
    }
}
