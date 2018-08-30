class MessagesController < ApplicationController
  before_action :set_conversation
  after_action :authorize_message

  def create
    @message = Message.new(message_params)
    @message.conversation = @conversation
    @message.user = current_user
    respond_to do |format|
      if @message.save
        format.js
        format.html { redirect_to conversation_path(@conversation) }
      else
        format.js
        format.html { render 'conversations/show' }
      end
    end
  end

  private

  def authorize_message
    authorize_message
  end

  def message_params
    params.require(:message).permit(:content)
  end

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end
end
