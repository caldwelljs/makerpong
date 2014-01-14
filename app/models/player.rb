class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
         # :validatable

  has_many :games
  has_many :opponents, through: :games

  mount_uploader :picture_url, ImageUploader
  mount_uploader :winning_pic1, ImageUploader
  mount_uploader :winning_pic2, ImageUploader
  mount_uploader :losing_pic1, ImageUploader
  mount_uploader :losing_pic2, ImageUploader
  mount_uploader :winning_pic3, ImageUploader
  mount_uploader :losing_pic3, ImageUploader
  
  def win_percentage
    if self.wins > 0 or self.losses > 0
      @calc_win_percentage ||= (self.wins.to_f / (self.wins + self.losses)).round(4)
    else
      0.00
    end
  end

  def self.power_ranking
    self.all.sort {|a, b| b.win_percentage <=> a.win_percentage}
  end

  def streak_display
    if win_streak > 0
      "Won #{self.win_streak}"
    else
      "Lost #{self.lose_streak}"
    end
  end

  def win_margin
  end
end