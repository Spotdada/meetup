Template.EventView.helpers
  eventParty: ->
    Meteor.users.find
      _id: $in: @party
  canJoin: ->
    Meteor.userId() not in @party
  canLeave: ->
    Meteor.userId() in @party and @party.length > 1
  comments: ->
    Comments.find eventId: @_id
  isLeader: (event) ->
    @_id is event.leaderId
  eventTime: ->
    moment(@datetime).calendar().toLowerCase()
  niceTags: ->
    @tags.join(', ')
  categoryTitle: ->
    Categories.findOne(@categoryId).title


Template.EventView.events
  'click #join-btn': ->
    Meteor.call "joinEvent", @_id
  'click #leave-btn': ->
    Meteor.call "leaveEvent", @_id
