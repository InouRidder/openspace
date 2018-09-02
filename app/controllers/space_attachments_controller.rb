class SpaceAttachmentsController < ApplicationController
  before_action :set_space_attachment

  def destroy
    @space_attachment.remove_photo!
    @space_attachment.destroy
    authorize @space_attachment
  end

  private


  def set_space_attachment
    @space_attachment = SpaceAttachment.find(params[:id])
  end
end
