$(document).on "turbolinks:load", ->
  $('.ui.dropdown').dropdown()
  if $("#book_author_id").length
    currentPage = 1
    appendToAuthors(currentPage)
    $("#book_author_id").siblings('.menu').on 'scroll', ->
      if $(this).scrollTop() + $(this).innerHeight() >= $(this)[0].scrollHeight
        appendToAuthors(currentPage += 1)

appendToAuthors = (page) ->
  url = "/authors.json?page=#{page}"
  $.get url, (data) ->
    if data && data.results && !data.error
      for author in data.results
        option_exists = 0 != $('#book_author_id option[value='+author.value+']').length
        $("#book_author_id").append("<option value='#{author.value}'>#{author.name}</option>") unless option_exists
