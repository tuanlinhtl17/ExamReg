$(document).ready(function () {
  initKhongDuDieuKiensImportTable()
});

let initKhongDuDieuKiensImportTable = () => {
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
