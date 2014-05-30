Template.newVideo.events
  'submit #newVideo': (event) ->
    event.preventDefault()
    data = SimpleForm.processForm(event.target)
    Video.create(data)
    $('.addVideo').dropdown('toggle')
    $('#youtubeId').val('')
    FlashMessages.sendSuccess("The video #{data.youtubeId} was added");
