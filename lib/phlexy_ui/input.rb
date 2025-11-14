# frozen_string_literal: true

module PhlexyUI
  class Input < Base
    def initialize(*, as: :input, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :input,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      xs: "input-xs",
      sm: "input-sm",
      md: "input-md",
      lg: "input-lg",
      xl: "input-xl",
      ghost: "input-ghost",
      neutral: "input-neutral",
      primary: "input-primary",
      secondary: "input-secondary",
      accent: "input-accent",
      info: "input-info",
      success: "input-success",
      warning: "input-warning",
      error: "input-error"
    )
  end
end

