module ApplicationHelper
    def material_kit_icons_flash(type)
        case type
        when :success
          "check"
        when :error
          "error_outline"
        when :alert
          "warning"
        when :notice
          "info_outline"
      end
    end

end
