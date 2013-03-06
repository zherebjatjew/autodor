# encoding : UTF-8

module ApplicationHelper
  def title
    base_title = "Автодор"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def user_status(user)
    if user.banned?
      image_tag("disabled.png", :alt => "Заблокирован", :class => "inline-img")
    else
      ''
    end
  end

  def logo
    l = image_tag("logo.png", :alt => "Логотип", :class => "round")
    link_to l, root_path
  end

  def company_name
    Company.first.name
  end

  def company_address
    Company.first.address1
  end

  def company_phones
    Company.first.phones
  end

  def company_schedule
    Company.first.schedule
  end

  def date_to_s(date)
    date.strftime "%d.%m.%Y" if !date.nil?
  end

  def time_to_s(date)
    date.strftime "%H:%M:00" if !date.nil?
  end

  def add_object_link(name, form, object, partial, where)
    html = render(:partial => partial, :locals => { :form => form, :object => object } )
    link_to_function name, %{
      var new_object_id = new Date().getTime() ;
      var html = jQuery(#{js html}.replace(/index_to_replace_with_js/g, new_object_id)).hide();
      html.appendTo(jQuery("#{where}")).slideDown('slow');
    }, :class => 'command'
  end

private

  def js(data)
    if data.respond_to? :to_json
      data.to_json
    else
      data.inspect.to_json
    end
  end

end


