Template.newVideo.events
  'submit #newVideo': (event) ->
    event.preventDefault()
    data = SimpleForm.processForm(event.target)
    Meteor.call('addVideo', data)
    $('.addVideo').dropdown('toggle')
    $('#youtubeId').val('')
    FlashMessages.sendSuccess("The video #{data.youtubeId} was added")
