Template.newVideo.events
  'submit #newVideo': (event) ->
    event.preventDefault()
    data = SimpleForm.processForm(event.target)
    url  = data.youtubeUrl
    $('.addVideo').dropdown('toggle')
    $('#youtubeUrl').val('')
    Meteor.call 'addVideo', data, (err, res) ->
      FlashMessages.sendError(res.msg) if res.type is 'error'
      FlashMessages.sendSuccess(res.msg) if res.type is 'success'
