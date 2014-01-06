class Game < ActiveRecord::Base

  belongs_to :player
  belongs_to :opponent, :class_name => "Player"

end
