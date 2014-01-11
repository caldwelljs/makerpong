class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
         # :validatable

  has_many :games
  has_many :opponents, through: :games

  mount_uploader :picture_url, ImageUploader

  # has_many :inverse_games, :class_name => "Game", :foreign_key => "game_id"
  # has_many :inverse_opponents, through: :inverse_opponents, :source => :player

end