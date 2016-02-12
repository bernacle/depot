# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready, page:change", -> # defines a function with 2 events, ready and page:change, one for deal with people redirected from another site and another that deals the people who were redirected from our site
  $('.store .entry > img').click -> # all images that are under store and entry, and for each one associate a click event
    $(this).parent().find(':submit').click() # starts with the element on which the event ocurred, here we call ˜this˜
                                             # finds the parent element, that is "entry"
                                             # find the submit button in that element and proceed to click it
