Template.ProfileView.helpers
  prettyCategories: ->
    titles = Categories.find(_id: $in: @categories).map (doc) ->
      doc.title
    titles.join(', ')
