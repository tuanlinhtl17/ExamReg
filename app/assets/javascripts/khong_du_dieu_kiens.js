$(document).ready(function () {
  initKhongDuDieuKiensTable()
});

let initKhongDuDieuKiensTable = () => {
  if (!$.fn.dataTable.isDataTable('#khongDuDieuKiens')) {
    $('#khongDuDieuKiens').DataTable({
      "language": datatableLanguage,
      "order": [
        [1, "asc"]
      ]
    });
  }
}
