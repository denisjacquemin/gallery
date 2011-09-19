# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('#new_invitation').live('ajax:success', (xhr, data, status) ->
  $('input#invitation_email').empty() ## doesn't works
  $('ul#pending-invitations').html('<li>'+data.email+' | ' + data.created_at + '</li>') ## highlight!
)