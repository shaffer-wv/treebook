class Status < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user

  validates :content, presence: true
  validates_length_of :content, :minimum => 2
  # these can be combined as validates :content, presence: true, length: { minimum: 2 }

  validates :user_id, presence: true
end
