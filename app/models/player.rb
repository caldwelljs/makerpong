class Player < ActiveRecord::Base

  has_many :games
  has_many :opponents, through: :games

end
