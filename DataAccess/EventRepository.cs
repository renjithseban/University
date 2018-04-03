using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace DataAccess
{
    public class EventRepository
    {
        private UniversityEntities context;
        private DbSet<Event> dbSet;

        public EventRepository(UniversityEntities context)
        {
            this.context = context;
            this.dbSet = context.Set<Event>();
        }

        public void Add(Event events)
        {
            try
            {
                if (events != null)
                {
                    Event newEntity = dbSet.Add(events);
                    dbSet.Attach(newEntity);
                    context.Entry(newEntity).State = EntityState.Added;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IEnumerable<Event> Get()
        {
            try
            {
                IQueryable<Event> query = dbSet;
                return query.ToList();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IEnumerable<Event> GetMany(Func<Event, bool> where)
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
