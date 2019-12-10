$(document).ready(function () {
  initKyThiTable()
});

const initKyThiTable = () => {
  $('#kyThi').DataTable({
    "language": datatableLanguage,
    "columnDefs": [{
        "orderable": false,
        "width": "10%",
        "targets": 2
      },
      {
        "width": "30%",
        "targets": 1
      }
    ]
  });
}
