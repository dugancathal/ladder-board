// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require nested_form

function getUserId() {
  if(id_input = $('#user_id'))
    return id_input.val();
  else
    return 0;
}

$(document).ready(function() {
  console.log('Pushing the data for ' + getUserId());
  _gaq.push([
    '_setCustomVar',
    1, // This custom var is set to slot #2.  Required parameter.
    'User ID', // The 2nd-level name for your online content categories.  Required parameter.
    getUserId() + '-Login', // Sets the value of "Sub-section" to "Fashion" for this particular article.  Required parameter.
    2 // Sets the scope to session-level.  Optional parameter.
  ]);

  _gaq.push([
    '_trackEvent',
    getUserId() + '-Login',
    'UserID'
  ]);
});
