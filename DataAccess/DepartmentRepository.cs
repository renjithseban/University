using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace DataAccess
{
    public class DepartmentRepository
    {
        private UniversityEntities context;
        private DbSet<Department> dbSet;

        public DepartmentRepository(UniversityEntities context)
        {
            this.context = context;
            this.dbSet = context.Set<Department>();
        }

        public void Add(Department department)
        {
            try
            {
                if (department != null)
                {
                    Department newEntity = dbSet.Add(department);
                    dbSet.Attach(newEntity);
                    context.Entry(newEntity).State = EntityState.Added;
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IEnumerable<Department> Get()
        {
            try
            {
                IQueryable<Department> query = dbSet;
                return query.ToList();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public IEnumerable<Department> GetMany(Func<Department, bool> where)
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
