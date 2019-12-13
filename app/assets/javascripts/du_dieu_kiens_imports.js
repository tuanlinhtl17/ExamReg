$(document).ready(function () {
  initDuDieuKiensImportTable()
});

let initDuDieuKiensImportTable = () => {
  if (!$.fn.dataTable.isDataTable('#duDieuKiensImport')) {
    $('#duDieuKiensImport').DataTable({
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
