﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using LTUDTM_DoAnMonHoc.fdFrmQuanLy.fdQuanLy;
using MyLibrary;
using LTUDTM_DoAnMonHoc.fdFrmQuanLy.fdBanHang;

namespace LTUDTM_DoAnMonHoc
{
    public partial class frmQuanLy : DevExpress.XtraEditors.XtraForm
    {
        public frmQuanLy()
        {
            InitializeComponent();
        }

        private void mnuPhanNhanVienVaoNhom_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FunctionStatic.hienThiFormMoi(this, new frmPhanNhanVienVaoNhom());
        }

        private void mnuPhanQuyenChoNhom_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FunctionStatic.hienThiFormMoi(this, new frmPhanQuyenChoNhom());
        }

        private void barButtonItem3_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FunctionStatic.hienThiFormMoi(this, new frmQuanLyPhieuNhapHang());
        }

        private void barItemGiaoDienBanHang_ItemClick(object sender, DevExpress.XtraBars.ItemClickEventArgs e)
        {
            FunctionStatic.hienThiFormMoi(this, new frmBanHang());
        }
    }
}