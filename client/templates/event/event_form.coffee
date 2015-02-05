Template.EventCreate.rendered = ->
  $('#tags-field').select2
    tags: []

  $('#address-field').select2
    minimumInputLength: 3
    query: (query) ->
      Meteor.call "locationAutocomplete",  query.term, (err, result) ->
        data = results: (id: i.description, text: i.description for i in result)
        query.callback data

AutoForm.hooks
  createEventForm:
    onSuccess: (operation, result) ->
      Router.go "event.show",
        _id: result