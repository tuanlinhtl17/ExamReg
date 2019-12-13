$(document).ready(function () {
  initSinhVienTable()
});

const initSinhVienTable = () => {
  if (!$.fn.dataTable.isDataTable('#sinhVien')) {
    $('#sinhVien').DataTable({
      "language": datatableLanguage
    });
  }
}
