Meteor.startup ->
  i18n.setLanguage 'en'
  moment.locale 'en'

  if navigator.geolocation
    Meteor.setInterval ->
      if Meteor.userId()
        navigator.geolocation.getCurrentPosition (position) ->
          Meteor.users.update Meteor.userId(),
            $set: loc:
              type: 'Point'
              coordinates: [
                position.coords.longitude
                position.coords.latitude
              ]
    , 1000


SimpleSchema.debug = true