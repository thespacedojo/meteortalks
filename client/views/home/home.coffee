Template.home.rendered = ->

  #SEO Page Title & Description
  document.title = "Meteor Talks - A place to learn about meteor.js"
  $("<meta>", { name: "description", content: "Videos about meteor.js" }).appendTo "head"

Template.videos.helpers

  rowedUpVideos: ()->
    return unless @videos
    grouped = _.groupBy @videos, (video, id) ->
      Math.floor(id/4)
    _.toArray(grouped)

