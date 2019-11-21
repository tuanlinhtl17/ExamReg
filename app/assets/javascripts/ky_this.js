$(document).ready( function () {
  initKyThiTable()
});

const initKyThiTable = () => {
  $('#kyThi').DataTable({
    "language": datatableLanguage
  });
}
