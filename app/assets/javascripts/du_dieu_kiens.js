$(document).ready(function () {
  initDuDieuKiensTable()
});

let initDuDieuKiensTable = () => {
  $('#duDieuKiens').DataTable({
    "language": datatableLanguage,
    "order": [
      [1, "asc"]
    ]
  });
}
