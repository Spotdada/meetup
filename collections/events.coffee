@Events = new Meteor.Collection "events"

Events.allow
  insert: (userId, doc) ->
    !!userId
  update: (userId, doc, fieldNames, modifier) ->
    doc.leaderId is userId