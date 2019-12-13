$(document).ready(function () {
  initDuDieuKiensTable()
});

let initDuDieuKiensTable = () => {
  if (!$.fn.dataTable.isDataTable('#duDieuKiens')) {
    $('#duDieuKiens').DataTable({
      "language": datatableLanguage,
      "order": [
        [1, "asc"]
      ]
    });
  }
}
