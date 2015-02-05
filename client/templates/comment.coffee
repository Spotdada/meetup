Template.CommentItem.helpers
  author: ->
    Meteor.users.findOne(@authorId)

  submitDate: ->
    moment(@timestamp).calendar().toLowerCase()

Template.CommentCreate.rendered = ->
  $("input[name=eventId]").val @data._id
