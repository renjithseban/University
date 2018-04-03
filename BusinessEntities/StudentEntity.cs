using System;

namespace BusinessEntities
{
    public class StudentEntity
    {
        public int StudentId { get; set; }

        public string FirstName { get; set; }

        public string MidlleName { get; set; }

        public string LastName { get; set; }

        public string FatherName { get; set; }

        public string MotherName { get; set; }

        public string StreetName { get; set; }

        public string ApartmentNo { get; set; }

        public int PostalCode { get; set; }

        public string City { get; set; }

        public string Country { get; set; }

        public string Nationality { get; set; }

        public DateTime DOB { get; set; }

        public string Sex { get; set; }

        public string PassportNo { get; set; }

        public DateTime ExpiryDate { get; set; }

        public int MobileNo { get; set; }

        public int AlternateMobileNo { get; set; }

        public string Email { get; set; }
    }
}
