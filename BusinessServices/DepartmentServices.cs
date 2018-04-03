using BusinessEntities;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessServices
{
    public class DepartmentServices : IDepartmentServices
    {
        private readonly DepartmentRepository deptRepository;
        private readonly StudentRepository studentRepository;
        private UniversityEntities context = new UniversityEntities();

        public DepartmentServices()
        {
            deptRepository = new DepartmentRepository(context);
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    deptRepository.Dispose();
                }
            }
            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public IEnumerable<DepartmentEntity> GetAllDepartments()
        {
            var deptList = deptRepository.Get();
            List<DepartmentEntity> deptEntities = null;
            if (deptList != null)
            {
                deptEntities = new List<DepartmentEntity>();
                foreach (var item in deptList)
                {
                    DepartmentEntity entity = new DepartmentEntity();
                    entity.DepartmentId = item.DepartmentId;
                    entity.DepartmentName = item.DepartmentName;
                    entity.Description = item.Description;
                    deptEntities.Add(entity);
                }
            }
            return deptEntities;
        }
    }
}
