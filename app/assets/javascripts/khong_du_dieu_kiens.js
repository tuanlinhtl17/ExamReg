$(document).ready(function () {
  initKhongDuDieuKiensTable()
});

let initKhongDuDieuKiensTable = () => {
  $('#khongDuDieuKiens').DataTable({
    "language": datatableLanguage,
    "order": [
      [1, "asc"]
    ]
  });
}
