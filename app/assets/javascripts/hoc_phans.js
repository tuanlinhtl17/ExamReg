$(document).ready(function () {
  initHocPhanTable()
});

let initHocPhanTable = () => {
  $('#hocPhan').DataTable({
    "language": datatableLanguage,
    "columnDefs": [{
      "orderable": false,
      "width": "10%",
      "targets": 2
    }]
  });
}
