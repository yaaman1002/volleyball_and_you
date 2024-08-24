class Public::MessagesController < ApplicationController
  before_action :check, only: [:message]

  def message
    @message = Message.new
    @messages = Message.where(send_user_id: current_user.id, receive_user_id: params[:user_id])
                       .or(
                          @receive_messages = Message.where(
                           send_user_id: params[:id],
                           receive_user_id: current_user.id
                          )
                        ).order(:created_at)
  end

def create
  @message = Message.new(message_params)
  @message.send_user_id = current_user.id
  if @message.save!
    @messages = Message.where(send_user_id: current_user.id,
                              receive_user_id: params[:message][:receive_user_id]).or(@receive_messages = Message.where(
                                send_user_id: params[:message][:receive_user_id], receive_user_id: current_user.id)).order(:created_at)
  else
    @message = Message.new
    @message = Message.where(send_user_id: current_user.id,
                             receive_user_id: params[:message][:receive_user_id]).or(@receive_messages = Message.where(
                               send_user_id: params[:message][:receive_user_id], receive_user_id: current_user.id)).order(:created_at)
    render :message
  end
end

private

def message_params
  params.require(:message).permit(:receive_user_id, :body)
end

def check
  if params[:user_id] == current_user.id
    redirect_back fallback_location: root_path
  else
    check1 = Relationship.exists?(followed_id: params[:user_id], follower_id: current_user.id)
    check2 = Relationship.exists?(follower_id: params[:user_id], followed_id: current_user.id)
    redirect_back fallback_location: root_path if !check1 || !check2
  end
end
end