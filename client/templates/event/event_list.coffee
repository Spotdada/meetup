Template.EventList.helpers
  events: ->
    tagFilter = Session.get("tagFilter") or []
    selector = _id: $in: Session.get("closeEvents") or []
    if tagFilter.length
      selector.tags = $all: tagFilter
    Events.find selector

Template.EventList.events
  "slide #range-slider": ->
    range = $("#range-slider").slider("getValue")
    if range != Session.get "rangeValue"
      Session.set "rangeValue", range
      Meteor.call 'getCloseEvents', range, (err, result) ->
        Session.set "closeEvents", result

  "change #tags-search": (e) ->
    Session.set "tagFilter", e.val

Template.EventList.rendered = ->
  $("#range-slider").slider
    min: 1
    max: 30
    formater: (value) -> " #{value} Kilometers"

  $("#tags-search").select2
    tags: []
