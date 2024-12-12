//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require bootstrap
//= require Chart.bundle
//= require chartkick

function getCSRFToken() {
    return document.querySelector('meta[name="csrf-token"]').getAttribute('content');
}

