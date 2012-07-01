# encoding : UTF-8
module UsersHelper

  def gravatar_for user, options = { :size => 50 }
    gravatar_image_tag user.email.downcase,
      :alt => user.name,
      :class => 'gravatar',
      :gravatar => options
  end

  # User roles list
  def self.roles
  	[ ["администратор", "admin"], ["оператор", "operator"] ]
  end

end
