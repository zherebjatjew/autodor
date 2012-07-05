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
  
end
