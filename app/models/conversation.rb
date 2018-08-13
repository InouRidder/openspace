class Conversation < ApplicationRecord
  has_many :subscriptions
  has_many :users, through: :subscriptions
  has_many :messages

  def self.find_or_create(users)
    conversation = self.includes(:subscriptions).find do |conversation|
      (conversation.subscriptions.pluck(:user_id) & users).sort == users.sort
    end

    if conversation
      conversation
    else
      new_conversation = Conversation.create
      users.each {|user_id| new_conversation.subscriptions.create(user_id: user_id) }
      new_conversation
    end
  end

  def last_message(user)
    messages_with_user = messages.includes(:user)
    message = messages_with_user.where.not(user: user).last
    message ? message : messages_with_user.includes(:user).last
  end

  def partner(current_user)
    users.find { |user| user != current_user }
  end
end


