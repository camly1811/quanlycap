//= require jquery
//= require bootstrap-sprockets
//= require bootstrap

function getCSRFToken() {
    return document.querySelector('meta[name="csrf-token"]').getAttribute('content');
}

