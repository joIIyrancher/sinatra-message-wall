class Message < ActiveRecord::Base
  validates :content, :author, presence: true
end
