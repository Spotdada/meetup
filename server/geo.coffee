@Geo =
  # https://developers.google.com/maps/documentation/geocoding/
  getCoordinatesByAddress: (address) ->
    response = Meteor.http.get "http://maps.googleapis.com/maps/api/geocode/json",
      params:
        address: address
        sensor: false

    response.data.results

  # https://developers.google.com/places/documentation/autocomplete
  locationAutocomplete: (input) ->
    response = Meteor.http.get "https://maps.googleapis.com/maps/api/place/autocomplete/json",
      params:
        input: input
        key: "AIzaSyBzEUf9gaqBb4Sa8sg9TpGjPAQ6eIYs2aw"
        sensor: false
        language: "en"
        types: "geocode"

    response.data.predictions