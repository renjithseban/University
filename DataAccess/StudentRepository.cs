using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace DataAccess
{
    public class StudentRepository : IDisposable
    {
        private UniversityEntities context;
        private DbSet<Student> dbSet;

        public StudentRepository(UniversityEntities context)
        {
            this.context = context;
            this.dbSet = context.Set<Student>();
        }

        public void Add(Student student)
        {
            try
            {
                if (student != null)
                {
                    Student newEntity = dbSet.Add(student);
                    dbSet.Attach(newEntity);
                    context.Entry(newEntity).State = EntityState.Added;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IEnumerable<Student> Get()
        {
            try
            {
                IQueryable<Student> query = dbSet;
                return query.ToList();
            }
            catch (Exception)
            {

                throw;
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
