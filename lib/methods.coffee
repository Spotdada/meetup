Meteor.methods
  updateProfile: (doc) ->
    Meteor.users.update Meteor.userId(),
      $set:
        profile: doc

  leaveEvent: (eventId) ->
    userId = Meteor.userId()
    event = Events.findOne eventId
    if event.party.length is 1
      return

    Events.update eventId,
      $pull: party: userId

    event = Events.findOne eventId
    if event.leaderId is userId
      Events.update eventId,
        $set: leaderId: event.party[0]

  joinEvent: (eventId) ->
    Events.update eventId,
      $addToSet: party: Meteor.userId()

  createComment: (doc) ->
    Comments.insert
      eventId: doc.eventId
      authorId: Meteor.userId()
      timestamp: new Date()
      text: doc.text