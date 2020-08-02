class FriendsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "friends_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
