var date1 = new Date("2014-09-28");
var date2 = new Date("2015-03-29");
var date3 = new Date("2015-06-21");
var date4 = new Date("2015-12-18");

if (Events.find().count() === 0) {
  Events.insert({
    title: 'Pikachu'
    eventDate: date1
  });

  Events.insert({
    title: 'Pichu',

    eventDate: date2
  });

  Events.insert({
    title: 'Raichu',
    eventDate: date3
  });

  Events.insert({
    title: 'Michu',
    eventDate: date4
  });
}
