Template.Login.events
  'click #facebook-login': ->
    Meteor.loginWithFacebook()

  'click #google-login': ->
    Meteor.loginWithGoogle()

Template.AccountInfo.events
  'click #logout': ->
    Meteor.logout ->
      Router.go "event.list"