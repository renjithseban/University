using BusinessEntities;
using System;
using System.Collections.Generic;

namespace BusinessServices
{
    public interface IDepartmentServices : IDisposable
    {
        IEnumerable<DepartmentEntity> GetAllDepartments();
    }
}
