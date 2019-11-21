$(document).ready( function () {
  initSinhVienTable()
});

const initSinhVienTable = () => {
  $('#sinhVien').DataTable({
    "language": datatableLanguage
  });
}
