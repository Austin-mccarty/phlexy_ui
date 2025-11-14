# frozen_string_literal: true

module PhlexyUI
  class Select < Base
    def initialize(*, as: :select, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :select,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      xs: "select-xs",
      sm: "select-sm",
      md: "select-md",
      lg: "select-lg",
      xl: "select-xl",
      ghost: "select-ghost",
      neutral: "select-neutral",
      primary: "select-primary",
      secondary: "select-secondary",
      accent: "select-accent",
      info: "select-info",
      success: "select-success",
      warning: "select-warning",
      error: "select-error"
    )
  end
end

