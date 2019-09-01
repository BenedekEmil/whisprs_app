# Run this example by adding <%= javascript_pack_tag 'hello_coffee' %> to the head of your layout file,
# like app/views/layouts/application.html.erb.
require("jquery")
toggleComments = (element, unique_id) ->
  if ($('#' + unique_id).css('display') == 'none')
    $('#' + unique_id).css("display", "block");
    console.log('1')
    element.style.color = '#aaa'
  else
    $('#' + unique_id).css("display", "none");
    console.log('2')
    element.style.color = '#1bb1bb'

$ ->
  $("span[data-unique-id]").click (e) ->
    e.preventDefault()

    unique_id = $(this).data("unique-id")
    console.log(unique_id)
    toggleComments(this, unique_id)