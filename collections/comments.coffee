@Comments = new Meteor.Collection "comments"

Comments.allow
  insert: (userId, doc) ->
    !!userId
  update: (userId, doc, fieldNames, modifier) ->
    userId is doc.authorId and 'authorId' not in fieldNames
  remove: (userId, doc) ->
    userId is doc.authorId
