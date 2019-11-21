$(document).ready( function () {
  initItemsImportTable()
});

let initItemsImportTable = () => {
  $('#itemsImport').DataTable({
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
