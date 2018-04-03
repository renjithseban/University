using BusinessEntities;
using System;
using System.Collections.Generic;

namespace BusinessServices
{
    public interface IStudentServices : IDisposable
    {
        IEnumerable<StudentEntity> GetAllStudents();
    }
}