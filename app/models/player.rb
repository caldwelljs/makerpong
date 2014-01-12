class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
         # :validatable

  has_many :games
  has_many :opponents, through: :games

  mount_uploader :picture_url, ImageUploader


  def win_percentage
    @win_percentage = (self.wins.to_f / (self.wins + self.losses)).round(4)
  end
end