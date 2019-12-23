$(document).ready(function () {
  initCaThiTable()
});

let initCaThiTable = () => {
  if (!$.fn.dataTable.isDataTable('#caThi')) {
    $('#caThi').DataTable({
      "language": datatableLanguage,
      "columnDefs": [{
        "orderable": false,
        "width": "10%",
        "targets": 5
      }]
    });
  }
}

let initCaThiSinhVienTable = () => {
  if (!$.fn.dataTable.isDataTable('#caThi')) {
    $('#caThiSinhVien').DataTable({
      "language": datatableLanguage,
      "columnDefs": [{
        "orderable": false,
        "width": "10%",
        "targets": 7
      }]
    });
  }
}
