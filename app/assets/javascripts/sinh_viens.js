$(document).ready(function () {
  initSinhVienTable()
});

const initSinhVienTable = () => {
  if (!$.fn.dataTable.isDataTable('#sinhVien')) {
    $('#sinhVien').DataTable({
      "language": datatableLanguage,
      "columnDefs": [{
        "orderable": false,
        "width": "10%",
        "targets": 5
      }]
    });
  }
}
