# frozen_string_literal: true

module PhlexyUI
  class Range < Base
    def initialize(*, as: :input, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :range,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, type: :range, class: classes, **options, &)
      end
    end

    register_modifiers(
      xs: "range-xs",
      sm: "range-sm",
      md: "range-md",
      lg: "range-lg",
      xl: "range-xl",
      neutral: "range-neutral",
      primary: "range-primary",
      secondary: "range-secondary",
      accent: "range-accent",
      info: "range-info",
      success: "range-success",
      warning: "range-warning",
      error: "range-error"
    )
  end
end
