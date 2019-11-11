$(document).ready(function () {
  initHocPhanTable()
});

let initHocPhanTable = () => {
  $('#hocPhan').DataTable({
    "language": datatableLanguage,
    "columnDefs": [{
      "orderable": false,
      "width": "7%",
      "targets": 2
    }]
  });
}
