$(document).ready(function () {
  initHocPhanTable()
});

let initHocPhanTable = () => {
  if (!$.fn.dataTable.isDataTable('#hocPhan')) {
    $('#hocPhan').DataTable({
      "language": datatableLanguage,
      "columnDefs": [{
        "orderable": false,
        "width": "10%",
        "targets": 2
      }]
    });
  }
}
