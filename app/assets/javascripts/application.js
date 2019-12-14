// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery3
//= require jquery_ujs
//= require datatables
//= require popper
//= require bootstrap-sprockets
//= require sweetalert2
//= require sweet-alert2-rails
//= require toastr
//= require select2
//= require bootstrap-datepicker
//= require cocoon
// require ActionCable
//= require_tree ./channels

//= require_tree .

const datatableLanguage = {
  'lengthMenu': 'Hiển thị _MENU_ kết quả mỗi trang',
  'zeroRecords': 'Không có kết quả',
  'info': 'Trang _PAGE_ / _PAGES_',
  'infoEmpty': 'Không có bản ghi',
  'infoFiltered': '(tìm kiếm từ _MAX_ kết quả)',
  'search': 'Tìm kiếm',
  'paginate': {
    'first': 'Trang đầu',
    'previous': 'Trước',
    'next': 'Tiếp theo',
    'last': 'Trang cuối'
  }
}

$(document).ready(function () {
  toastr.options = {
    'closeButton': false,
    'debug': false,
    'positionClass': 'toast-top-right',
    'onclick': null,
    'showDuration': '300',
    'hideDuration': '1000',
    'timeOut': '5000',
    'extendedTimeOut': '1000',
    'showEasing': 'swing',
    'hideEasing': 'linear',
    'showMethod': 'fadeIn',
    'hideMethod': 'fadeOut'
  }

  window.sweetAlertConfirmConfig = {
    showCancelButton: true,
    confirmButtonColor: '#00BFFF',
    confirmButtonText: 'Đồng ý',
    cancelButtonText: 'Thoát',
  };

  // Javascript to enable link to tab
  var url = document.location.toString();
  if (url.match('#')) {
    $('.nav-tabs a[href="#' + url.split('#')[1] + '"]').tab('show');
  }

  // Change hash for page-reload
  $('.nav-tabs a').on('shown.bs.tab', function (e) {
    window.location.hash = e.target.hash;
  })
});
