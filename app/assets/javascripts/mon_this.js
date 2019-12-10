$(document).ready(function () {
  initMonThiTable()
});

let initMonThiTable = () => {
  $('#monThi').DataTable({
    "language": datatableLanguage,
    "columnDefs": [{
      "orderable": false,
      "width": "10%",
      "targets": 1
    }]
  });
}
