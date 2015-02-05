@EventSchema = new SimpleSchema
  title:
    type: String
    label: "Title"
  description:
    type: String
    label: "Description"
    optional: true
    autoform:
      rows: 3
  tags:
    type: [String]
    label: 'Tag the event'
    optional: true
  categoryId:
    type: String
    label: 'category'
    autoform:
      firstOption: "(Select)"
      type: "select2"
      options: ->
        Categories.find().map (doc) ->
          value: doc._id
          label: doc.title
  address:
    type: String
    label: "Venue"
  datetime:
    type: Date
    optional: true
    label: "time"
    autoform:
      afFieldInput:
        type: "bootstrap-datetimepicker"
      dateTimePickerOptions:
        format: 'DD.MM.YY HH:mm'
        language: 'en'
