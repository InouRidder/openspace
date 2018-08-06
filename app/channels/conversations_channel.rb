class ConversationsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "conversation_#{params[:chat_room_id]}"
  end
end
