//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class Program
    {
        public int ProgramId { get; set; }
        public string ProgramName { get; set; }
        public string Description { get; set; }
        public string Abstract { get; set; }
        public int DepartmentId { get; set; }
        public int TypeId { get; set; }
    
        public virtual Department Department { get; set; }
        public virtual ProgramType ProgramType { get; set; }
    }
}
