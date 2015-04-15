module ApplicationHelper

  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end

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

  private
    def sort_column
      params[:sort] || "name"
    end
    
    def sort_direction
      params[:direction] || "asc"
    end

end
