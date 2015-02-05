@CommentSchema = new SimpleSchema
  eventId:
    type: String
    autoform:
      label: false
      afFieldInput:
        type: "hidden"
  text:
    type: String
    autoform:
      label: false
      rows: 3
