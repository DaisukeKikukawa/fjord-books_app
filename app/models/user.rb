# frozen_string_literal: true

class User < ApplicationRecord

  has_many :followers,
           class_name: 'Follow',
           foreign_key: 'follower_id',
           dependent: :destroy,
           inverse_of: :follower

  has_many :followings,
           class_name: 'Follow',
           foreign_key: 'following_id',
           dependent: :destroy,
           inverse_of: :following

  has_many :following_users, through: :followers, source: :following

  has_many :follower_users, through: :followings, source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  def follow(other_user_id)
    followers.create(following_id: other_user_id)
  end

  # def unfollow(other_user)
  #   followers.find_by(follower_id: other_user_id)&.destroy
  # end

  def following?(other_user)
    following_users.include?(other_user)
  end

end
