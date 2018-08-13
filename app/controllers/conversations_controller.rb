class ConversationsController < ApplicationController
  def index
    @conversations = current_user.conversations.includes(:messages)
    respond_to do |format|
      format.html
      format.json { render json: {succes: 200} }
    end
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = Message.new
  end

  def create
    @conversation = Conversation.find_or_create([current_user.id, params[:host_id].to_i])
    redirect_to conversation_path(@conversation)
  end

end
