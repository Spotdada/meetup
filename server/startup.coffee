Meteor.startup ->
  if not Categories.find().count()
    mtgId = Categories.insert
      title: "Heavy Metal Music"
    Categories.insert
      title: "Iron Maiden"

  if not Events.find().count()
    Events.insert
      title: "Slayer gig"
      description: "KERRY FUCKING KING"
      categoryId: mtgId
      place:
        address: "PURGATORY"
        loc:
          type: "Point"
          coordinates: [37.653065, 55.708633]
      party: []
      leaderId: 'asdqwe'
      tags: ['magic', 'Whores']
