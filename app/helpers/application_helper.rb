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

  def logo
    l = image_tag("logo.png", :alt => "Logo", :class => "round")
    link_to l, root_path
  end

  def company_name
    "ООО «АвтоДор Омск»"
  end

  def company_address
    "644047, г.Омск, ул. 2-я Береговая, 17а"
  end

  def company_phones
    "89136783350 – МТС, 83812465717-ГТС"
  end

  def company_schedule
    "24/7"
  end

  def date_to_s date
    date.strftime "%d.%m.%Y" if !date.nil?
  end

  def add_object_link(name, form, object, partial, where)
    options = {:parent => true}#.merge(options)
    html = render(:partial => partial, :locals => { :form => form, :object => object } )
    link_to_function name, %{
      var new_object_id = new Date().getTime() ;
      var html = jQuery(#{js html}.replace(/index_to_replace_with_js/g, new_object_id)).hide();
      html.appendTo(jQuery("#{where}")).slideDown('slow');
    }
  end

  def js(data)
    if data.respond_to? :to_json
      data.to_json
    else
      data.inspect.to_json
    end
  end

end
