Template.header.events
  'submit #search': (event) ->
    event.preventDefault()
    query = $(event.target).find("input[name=query]").val()
    if query
      Router.go("/search/#{query}")
    else
      FlashMessages.sendError("Put in a search query");
      Session.set('searchError', true)


Template.header.helpers
  'searchError': ->
    'has-error' if Session.get('searchError')


Template.layout.events
  'closed.bs.alert': (event) ->
    Session.set('searchError', undefined)
