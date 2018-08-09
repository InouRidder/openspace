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

    # TO DO: Convert this into SQL for performance.
    # " WHERE EXISTS ( SELECT 2
    #                  FROM subscriptions s
    #                  WHERE s.conversation_id = conversations.id
    #                  AND s.user_id IN (#{ids})
    #                 )"
    #  ActiveRecord::Base.connection.execute(sql)
  end
end


