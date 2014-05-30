Template.home.rendered = ->

  #SEO Page Title & Description
  document.title = "My New Meteor App"
  $("<meta>", { name: "description", content: "Page description for My New Meteor App" }).appendTo "head"

Template.videos.helpers

  rowedUpVideos: ()->
    return unless @videos
    grouped = _.groupBy @videos, (video, id) ->
      Math.floor(id/4)
    _.toArray(grouped)
