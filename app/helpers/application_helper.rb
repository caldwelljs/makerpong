module ApplicationHelper
  include ActiveSupport::Inflector

 def resource_name
    :player
  end

  def resource
    @resource ||= Player.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:player]
  end

  def resource_class 
    Player 
  end

  def first_name
  end

  def last_name
  end

  def leaders
    Player.where('wins + losses >= ?', 5)
  end



  # def profile_pic_display
  #   if player.picture_url.empty?
  #     # images/default_profile_pic_big.jpg
  #     "Default"
  #   else
  #     # player.picture_url
  #     "Filler"
  #   end
  # end

end
