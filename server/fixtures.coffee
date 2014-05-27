Meteor.startup ->
  if Video.all().length is 0
    Video.create({title: 'Test Video', thumbnail: '/images/thumb.png', duration: 3600, youtubeId: '12345'})
