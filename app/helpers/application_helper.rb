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

end
