$(document).ready(function () {
  initKhongDuDieuKiensImportTable()
});

let initKhongDuDieuKiensImportTable = () => {
  if (!$.fn.dataTable.isDataTable('#khongDuDieuKiensImport')) {
    $('#khongDuDieuKiensImport').DataTable({
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
