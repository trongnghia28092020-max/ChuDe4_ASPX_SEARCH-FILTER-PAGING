namespace ChuDe4_ASPX_SEARCH_FILTER_PAGING.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SinhVien")]
    public partial class SinhVien
    {
        [Key]
        [StringLength(20)]
        public string MaSV { get; set; }

        [StringLength(100)]
        public string HoTen { get; set; }

        [StringLength(10)]
        public string GioiTinh { get; set; }

        [StringLength(20)]
        public string NganhHoc { get; set; }

        [StringLength(100)]
        public string Email { get; set; }

        public double? DiemTB { get; set; }
    }
}
