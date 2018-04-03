using BusinessEntities;
using DataAccess;
using System;
using System.Collections.Generic;

namespace BusinessServices
{
    public class StudentServices : IStudentServices
    {
        private readonly StudentRepository studentRepository;
        private UniversityEntities context = new UniversityEntities();

        public StudentServices()
        {
            studentRepository = new StudentRepository(context);
        }

        private bool disposed = false;

        protected virtual void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    studentRepository.Dispose();
                }
            }
            this.disposed = true;
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        public IEnumerable<StudentEntity> GetAllStudents()
        {
            return null;
        }
    }
}
