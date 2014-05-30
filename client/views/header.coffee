Template.header.events
  'submit #search': (event) ->
    event.preventDefault()
    query = $(event.target).find("input[name=query]").val()
    Router.go("/search/#{query}")

Template.header.helpers

