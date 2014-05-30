if Meteor.isServer
  @Future = Npm.require('fibers/future')

class @Video extends Minimongoid

  @_collection: new Meteor.Collection('videos')

  @before_create: (video) ->
    video.viewCount = 0
    video

  @after_create: (video) ->
    console.log video._id
    Meteor.call('fetchVideo', video._id)
    video

  formattedDuration: ->
    minutes = Math.floor(@duration / 60)
    seconds = @duration - minutes * 60
    if seconds > 10
      "#{minutes}:#{seconds}"
    else
      "#{minutes}:0#{seconds}"

  formattedDescription: ->
    newLined = @description.replace(/\n/g, '<br />')
    exp = /(\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/ig
    newLined.replace(exp,"<a href='$1' rel='nofollow'>$1</a>")

  truncatedDescription: ->
    @formattedDescription()[0..400] + '...'

  youtubeLikes: ->
    parseInt(@likeCount / 100)

Video._collection.allow
  insert: (userId, video) ->
    userId

Meteor.methods

  fetchVideo: (videoId) ->
    if Meteor.isServer
      future = new Future()
      video = Video.first(videoId)
      Youtube.video video.youtubeId, (error, data) ->
        if error
          future.return ""
        else
          future.return data
      info = future.wait()
      console.log info
      data = {title: info.title, description: info.description, thumbnail: info.thumbnail.hqDefault, player: info.player.default, mobilePlayer: info.player.mobile, likeCount: info.likeCount, duration: info.duration, uploadedAt: new Date(info.uploaded)}
      video.update(data)
