using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessEntities
{
    public class HomeEntity
    {
        public IEnumerable<NewsEntity> News { get; set; }

        public IEnumerable<EventEntity> Events { get; set; }

        public IEnumerable<DepartmentEntity> Departments { get; set; }
    }
}
