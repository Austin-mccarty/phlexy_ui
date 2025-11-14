# frozen_string_literal: true

module PhlexyUI
  class Toggle < Base
    def initialize(*, as: :input, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :toggle,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, type: :checkbox, class: classes, **options, &)
      end
    end

    register_modifiers(
      xs: "toggle-xs",
      sm: "toggle-sm",
      md: "toggle-md",
      lg: "toggle-lg",
      xl: "toggle-xl",
      neutral: "toggle-neutral",
      primary: "toggle-primary",
      secondary: "toggle-secondary",
      accent: "toggle-accent",
      info: "toggle-info",
      success: "toggle-success",
      warning: "toggle-warning",
      error: "toggle-error"
    )
  end
end

