@ProfileSchema = new SimpleSchema
  name:
    type: String
    label: "First Name"
  gender:
    type: String
    label: "Select"
    optional: true
    allowedValues: ['M', 'F']
    autoform:
      firstOption: "choose"
      type: "select2"
      options:
        Titles.gender
  categories:
    type: [String]
    label: "interests"
    optional: true
    autoform:
      firstOption: false
      placeholder: "add interest categories"
      type: "select2"
      multiple: true
      options: ->
        Categories.find().map (doc) ->
          value: doc._id
          label: doc.title
