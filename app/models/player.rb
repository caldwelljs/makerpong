class Player < ActiveRecord::Base
  
  validates_presence_of :name

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable

  has_many :games
  has_many :visits, class_name: "Game", foreign_key: :opponent_id
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

  def self.win_streak_sorting
    self.all.sort {|a, b| b.win_streak <=> a.win_streak}
  end


  def first_name
    @first_name ||= name.split[0]
  end

  def last_name
    @last_name ||= name.split[1..-1].join(" ")
  end


end