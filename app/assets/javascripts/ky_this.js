$(document).ready(function () {
  initKyThiTable()
});

const initKyThiTable = () => {
  if (!$.fn.dataTable.isDataTable('#kyThi')) {
    $('#kyThi').DataTable({
      "language": datatableLanguage,
      "columnDefs": [{
        "orderable": false,
        "width": "10%",
        "targets": 4
      }]
    });
  }
}
