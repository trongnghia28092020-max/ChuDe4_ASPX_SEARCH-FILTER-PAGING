<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Frm_Search_Filter_Paging.aspx.cs" Inherits="ChuDe4_ASPX_SEARCH_FILTER_PAGING.Frm_Search_Filter_Paging" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Tìm kiếm sinh viên</title>
</head>
<body style="margin:0; 
             padding:25px; 
             background:#f4f7fb; 
             font-family:Arial, sans-serif; 
             color:#263445;">
<form id="form1" runat="server">
<div style="max-width:1050px; 
            margin:0 auto; 
            background:white; 
            padding:28px; 
            border-radius:12px; 
            box-shadow:0 4px 18px rgba(30,60,90,.08);">
    <h2 style="margin:0 0 7px; 
               color:#1f4e79; 
               font-size:25px;">QUẢN LÝ SINH VIÊN</h2>


    <div style="display:flex; 
                flex-wrap:wrap; gap:12px; 
                align-items:end; padding:16px; 
                background:#f7faff; border:1px solid #e3ebf5; 
                border-radius:9px; margin-bottom:18px;">
        <div style="flex:2; min-width:210px;">
            <label for="txtTuKhoa" style="display:block; 
                                          margin-bottom:7px;
                                          font-size:13px; 
                                          font-weight:bold;">Từ khóa</label>
            <asp:TextBox ID="txtTuKhoa" runat="server" placeholder="Nhập mã hoặc họ tên..."
                style="box-sizing:border-box; width:100%; 
                       padding:10px 12px; 
                       border:1px solid #cbd5e1; 
                       border-radius:6px; font-size:14px;" />
        </div>
        <div style="flex:1; min-width:160px;">
            <label for="ddlNganh" style="display:block; 
                                         margin-bottom:7px; 
                                         font-size:13px; 
                                         font-weight:bold;">Ngành học</label>
            <asp:DropDownList ID="ddlNganh" runat="server" 
                              style="box-sizing:border-box; 
                                     width:100%; padding:10px; 
                                     border:1px solid #cbd5e1; 
                                     border-radius:6px; 
                                     background:white;">
                <asp:ListItem Value="">Tất cả ngành</asp:ListItem>
                <asp:ListItem Value="CNTT">Công nghệ thông tin</asp:ListItem>
                <asp:ListItem Value="QTKD">Quản trị kinh doanh</asp:ListItem>
                <asp:ListItem Value="NNA">Ngôn ngữ Anh</asp:ListItem>
                <asp:ListItem Value="KHMT">Khoa học máy tính</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div style="flex:1; min-width:160px;">
            <label for="ddlSapXep" style="display:block; 
                                          margin-bottom:7px; 
                                          font-size:13px; 
                                          font-weight:bold;">Sắp xếp</label>
            <asp:DropDownList ID="ddlSapXep" runat="server"
                              style="box-sizing:border-box; 
                                     width:100%; padding:10px; 
                                     border:1px solid #cbd5e1; 
                                     border-radius:6px; 
                                     background:white;">
                <asp:ListItem Value="MaSV">Mã sinh viên</asp:ListItem>
                <asp:ListItem Value="HoTen">Họ tên A - Z</asp:ListItem>
                <asp:ListItem Value="DiemTang">Điểm tăng dần</asp:ListItem>
                <asp:ListItem Value="DiemGiam">Điểm giảm dần</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:Button ID="btnTimKiem" runat="server" Text="Tìm kiếm" OnClick="btnTimKiem_Click"
            style="padding:10px 19px; 
                   border:0; 
                   border-radius:6px; 
                   background:#2463a6; 
                   color:white; 
                   font-weight:bold; 
                   cursor:pointer;" />
        <asp:Button ID="btnLamMoi" runat="server" Text="Làm mới" OnClick="btnLamMoi_Click"
            style="padding:10px 17px; 
                   border:1px solid #cbd5e1; 
                   border-radius:6px; 
                   background:white; 
                   color:#334155; 
                   cursor:pointer;" />
    </div>

    <div style="display:flex; 
                justify-content:space-between; 
                align-items:center; 
                flex-wrap:wrap; 
                gap:8px; 
                margin:14px 0;">
        <asp:Label ID="lblThongKe" runat="server" style="font-size:14px; color:#475569; font-weight:bold;" />
    </div>

    <div style="overflow-x:auto; border:1px solid #e2e8f0; border-radius:8px;">
        <asp:GridView ID="gvSinhVien" runat="server" AutoGenerateColumns="False" GridLines="None"
            Width="100%" EmptyDataText="Không tìm thấy sinh viên phù hợp."
            HeaderStyle-BackColor="#eaf1f8" HeaderStyle-ForeColor="#24476b"
            HeaderStyle-Font-Bold="true" HeaderStyle-Height="42px"
            RowStyle-Height="42px" AlternatingRowStyle-BackColor="#f8fafc" CellPadding="9">
            <Columns>
                <asp:BoundField DataField="MaSV" HeaderText="Mã sinh viên" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="HoTen" HeaderText="Họ và tên" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="GioiTinh" HeaderText="Giới tính" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="TenNganh" HeaderText="Ngành học" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                <asp:BoundField DataField="DiemTB" HeaderText="Điểm TB" DataFormatString="{0:0.00}" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
            </Columns>
        </asp:GridView>
    </div>

    <div style="display:flex; 
                justify-content:center; 
                align-items:center; 
                gap:14px; 
                margin-top:18px;">
        <asp:Button ID="btnTrangTruoc" runat="server" Text="← Trang trước" OnClick="btnTrangTruoc_Click"
            style="padding:8px 13px; border:1px solid #cbd5e1; border-radius:6px; background:white; cursor:pointer;" />
        <asp:Label ID="lblTrang" runat="server" style="font-size:13px; color:#475569; font-weight:bold;" />
        <asp:Button ID="btnTrangSau" runat="server" Text="Trang sau →" OnClick="btnTrangSau_Click"
            style="padding:8px 13px; border:1px solid #cbd5e1; border-radius:6px; background:white; cursor:pointer;" />
    </div>
</div>
</form>
</body>
</html>
