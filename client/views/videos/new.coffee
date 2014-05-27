Template.newVideo.events
  'submit #newVideo': (event) ->
    event.preventDefault()
    data = SimpleForm.processForm(event.target)
    Video.create(data)
    Router.go('/')
