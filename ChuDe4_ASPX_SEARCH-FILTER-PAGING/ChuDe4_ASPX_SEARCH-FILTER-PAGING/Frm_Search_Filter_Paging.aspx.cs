using ChuDe4_ASPX_SEARCH_FILTER_PAGING.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ChuDe4_ASPX_SEARCH_FILTER_PAGING
{
    public partial class Frm_Search_Filter_Paging : System.Web.UI.Page
    {
        private const int SoLuongMoiTrang = 20;
        private int TrangHienTai
        {
            get { return ViewState["TrangHienTai"] == null ? 1 : (int)ViewState["TrangHienTai"]; }
            set { ViewState["TrangHienTai"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                TrangHienTai = 1;
                HienThiSinhVien();
            }
        }
        private void HienThiSinhVien()
        {
            using (QLSV db = new QLSV())
            {
                var query = db.SinhVien.AsQueryable();
                string tuKhoa = txtTuKhoa.Text.Trim();
                if (!string.IsNullOrEmpty(tuKhoa))
                {
                    query = query.Where(sv => sv.MaSV.Contains(tuKhoa) || sv.HoTen.Contains(tuKhoa));
                }

                string maNganh = ddlNganh.SelectedValue;
                if (!string.IsNullOrEmpty(maNganh))
                {
                    query = query.Where(sv => sv.NganhHoc == maNganh);
                }

                switch (ddlSapXep.SelectedValue)
                {
                    case "HoTen":
                        query = query.OrderBy(sv => sv.HoTen);
                        break;
                    case "DiemTang":
                        query = query.OrderBy(sv => sv.DiemTB);
                        break;
                    case "DiemGiam":
                        query = query.OrderByDescending(sv => sv.DiemTB);
                        break;
                    default:
                        query = query.OrderBy(sv => sv.MaSV);
                        break;
                }

                int tongSoSinhVien = query.Count();
                int tongSoTrang = Math.Max(1, (int)Math.Ceiling((double)tongSoSinhVien / SoLuongMoiTrang));

                if (TrangHienTai > tongSoTrang)
                    TrangHienTai = tongSoTrang;

                
                var duLieuTrangDB = query
                    .Skip((TrangHienTai - 1) * SoLuongMoiTrang)
                    .Take(SoLuongMoiTrang)
                    .ToList();

                
                var duLieuHienThi = duLieuTrangDB.Select(sv => new {
                    MaSV = sv.MaSV,
                    HoTen = sv.HoTen,
                    GioiTinh = sv.GioiTinh,
                    TenNganh = sv.NganhHoc == "CNTT" ? "Công nghệ thông tin" :
                               sv.NganhHoc == "QTKD" ? "Quản trị kinh doanh" :
                               sv.NganhHoc == "NNA" ? "Ngôn ngữ Anh" :
                               sv.NganhHoc == "KHMT" ? "Khoa học máy tính" : sv.NganhHoc,
                    Email = sv.Email,
                    DiemTB = sv.DiemTB
                }).ToList();

                
                gvSinhVien.DataSource = duLieuHienThi;
                gvSinhVien.DataBind();

                
                lblThongKe.Text = "Tìm thấy " + tongSoSinhVien + " sinh viên";
                lblTrang.Text = "Trang " + TrangHienTai + " / " + tongSoTrang;
                btnTrangTruoc.Enabled = TrangHienTai > 1;
                btnTrangSau.Enabled = TrangHienTai < tongSoTrang;
            }
        }

        protected void btnTimKiem_Click(object sender, EventArgs e)
        {
            TrangHienTai = 1;
            HienThiSinhVien();
        }

        protected void btnLamMoi_Click(object sender, EventArgs e)
        {
            txtTuKhoa.Text = "";
            ddlNganh.SelectedIndex = 0;
            ddlSapXep.SelectedValue = "MaSV";
            TrangHienTai = 1;
            HienThiSinhVien();
        }

        protected void btnTrangTruoc_Click(object sender, EventArgs e)
        {
            if (TrangHienTai > 1) TrangHienTai--;
            HienThiSinhVien();
        }

        protected void btnTrangSau_Click(object sender, EventArgs e)
        {
            TrangHienTai++;
            HienThiSinhVien();
        }
    }
}