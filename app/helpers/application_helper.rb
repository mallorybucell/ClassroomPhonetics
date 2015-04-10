module ApplicationHelper

  def translate_to_bootstrap flash_class
    case flash_class.to_sym
    when :notice
      :success
    when :alert
      :danger
    else
      flash_class
    end
  end

  def icon name
    "<i class='glyphicon glyphicon-#{name}'></>".html_safe
  end

end
