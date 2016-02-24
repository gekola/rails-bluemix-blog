App.cable.subscriptions.create 'PostsChannel',
  posts: -> $('tbody')

  received: (data) ->
    @posts().prepend(data.html)
