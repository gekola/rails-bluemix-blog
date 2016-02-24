class PostsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'posts_notifications'
  end
end

