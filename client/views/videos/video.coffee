Template.video.rendered = ()->
  Shadowbox.init({skipSetup: true})
  Shadowbox.setup('a.shadowbox')

Template.video.events

  'click .shadowbox': (event) ->
    Meteor.call('viewedVideo', @id) 
