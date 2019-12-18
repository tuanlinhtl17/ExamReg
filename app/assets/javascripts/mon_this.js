$(document).ready(function () {
  initMonThiTable();
});

let initMonThiTable = () => {
  if (!$.fn.dataTable.isDataTable('#monThi')) {
    $('#monThi').DataTable({
      "language": datatableLanguage,
      "columnDefs": [{
        "orderable": false,
        "width": "10%",
        "targets": 1
      }]
    });
  }
}

let initdangKyThiTable = () => {
  if (!$.fn.dataTable.isDataTable('#dangKy')) {
    $('#dangKy').DataTable({
      "language": datatableLanguage,
      "columnDefs": [{
        "orderable": false,
        "width": "10%",
        "targets": 1
      }]
    });
  }
}
