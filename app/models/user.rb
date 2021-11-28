# frozen_string_literal: true

class User < ApplicationRecord

  ham_many :followers,
            class_name: 'Follow',
            foreign_key: 'follower_id',
            dependent: :destroy,
            inverse_of: :follower

  ham_many :followings,
            class_name: 'Follow',
            foreign_key: 'following_id',
            dependent: :destroy,
            inverse_of: :following

  has_many :following_users, through: :followers, source: :following

  has_many :follower_users, through: :followings, source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
end
