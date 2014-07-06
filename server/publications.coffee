Meteor.publish 'videos', (query) ->
  if query
    Video.find($or: [{title: {$regex: query, $options: 'i'}}, {description: {$regex: query, $options: 'i'}}], {sort: {uploadedAt: -1}})
  else
    Video.find({}, {sort: {uploadedAt: -1}, limit: 8})

Meteor.publish 'videoCount', ()->
  publishCount @, 'videos-count', Video.find({})
