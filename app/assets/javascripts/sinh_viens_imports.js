$(document).ready(function () {
  initSinhViensImportTable()
});

let initSinhViensImportTable = () => {
  if (!$.fn.dataTable.isDataTable('#sinhViensImport')) {
    $('#sinhViensImport').DataTable({
      "language": datatableLanguage,
      "columnDefs": [{
        "orderable": false,
        "width": "10%",
        "targets": 2
      }],
      "order": [
        [1, "asc"]
      ]
    });
  }
}
