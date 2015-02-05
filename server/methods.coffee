Meteor.methods
  getCloseEvents: (km) ->
    user = Meteor.users.findOne(@userId)
    (e._id for e in Events.find(
      "place.loc": $geoWithin: $centerSphere:
        [user.loc.coordinates, km / 6371]
      ).fetch()
    )

  createEvent: (doc) ->
    eventId = Events.insert
      title: doc.title
      description: doc.description
      categoryId: doc.categoryId
      datetime: doc.datetime
      tags: doc.tags or []
      leaderId: @userId
      party: [@userId]
      place:
        address: doc.address

    if doc.address
      results = Geo.getCoordinatesByAddress doc.address
      if results.length
        Events.update eventId,
          $set:
            "place.loc":
              type: "Point"
              coordinates: [
                results[0].geometry.location.lng
                results[0].geometry.location.lat
              ]
    eventId

  locationAutocomplete: (input) ->
    Geo.locationAutocomplete(input)
