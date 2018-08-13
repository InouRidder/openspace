class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  after_create :broadcast_message

  def broadcast_message
    ActionCable.server.broadcast("conversation_#{conversation.id}", {
      message_partial: ApplicationController.renderer.render(
        partial: "messages/message",
        locals: { message: self }
      ),
      current_user_id: user.id
    })
  end

end
