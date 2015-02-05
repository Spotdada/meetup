Meteor.publish 'events', ->
  if @userId
    currentUser = Meteor.users.findOne @userId
    selector = 'place.loc': $geoWithin: $centerSphere:
      [currentUser.loc.coordinates, 30 / 6371]  # limits 30 км
    if currentUser.profile.categories and currentUser.profile.categories.length
      selector.categoryId = $in: currentUser.profile.categories
    Events.find selector
  else
    @ready()

Meteor.publish 'singeEvent', (_id) ->
  Events.find _id

Meteor.publish 'eventParty', (_id) ->
  event = Events.findOne _id
  Meteor.users.find
    _id: $in: event.party

Meteor.publish 'userProfile', (_id) ->
  Meteor.users.find _id,
    fields: profile: 1

Meteor.publish 'eventComments', (_id) ->
  Comments.find eventId: _id

Meteor.publish 'categories', ->
  Categories.find()

Meteor.publish 'closePeople', ->
  if @userId
    currentUser = Meteor.users.findOne @userId
    if currentUser.loc
      Meteor.users.find
        loc: $geoWithin: $centerSphere:
          [currentUser.loc.coordinates, 30 / 6371]  # within 30 км
  @ready()
