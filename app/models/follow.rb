class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User'
  belongs_to :following, class_name: 'User'
  validates :follower_id, presense: true
  validates :following_id, presense: true
end
