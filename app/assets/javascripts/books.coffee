$(document).on "turbolinks:load", ->
  if $("#book_author_id").length
    url = "/authors.json"
    $.get url, (data) ->
      if data && data.results && !data.error
        for author in data.results
          option_exists = 0 != $('#book_author_id option[value='+author.value+']').length
          $("#book_author_id").append("<option value='#{author.value}'>#{author.name}</option>") unless option_exists