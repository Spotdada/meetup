Router.configure
  layoutTemplate: 'Layout'
  onBeforeAction: ->
    if Meteor.userId()
      @next()
    else
      @render 'Login'

Router.route '/',
  template: 'EventList'
  name: 'event.list'
  waitOn: ->
    Meteor.subscribe 'events'

Router.route 'events/:_id',
  template: 'EventView'
  name: 'event.show'
  data: ->
    Events.findOne @params._id
  waitOn: ->
    [
      Meteor.subscribe 'singeEvent', @params._id
      Meteor.subscribe 'eventParty', @params._id
      Meteor.subscribe 'eventComments', @params._id
      Meteor.subscribe 'categories'
    ]

Router.route 'create_event',
  template: 'EventCreate'
  name: 'event.create'
  subscriptions: ->
    @subscribe 'categories'

Router.route 'profile/edit/:_id',
  template: 'ProfileEdit'
  name: 'profile.edit'
  waitOn: ->
    Meteor.subscribe 'userProfile'
  subscriptions: ->
    @subscribe 'categories'

Router.route 'profile/:_id',
  template: 'ProfileView'
  name: 'profile.show'
  waitOn: ->
    [
      Meteor.subscribe 'userProfile'
      Meteor.subscribe 'categories'
    ]
  data: ->
    user = Meteor.users.findOne @params._id
    user.profile if user

Router.route 'people',
  template: 'PeopleList'
  name: 'people.list'
  waitOn: ->
    Meteor.subscribe 'closePeople'