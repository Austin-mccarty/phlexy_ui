# frozen_string_literal: true

module PhlexyUI
  class Textarea < Base
    def initialize(*, as: :textarea, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :textarea,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      xs: "textarea-xs",
      sm: "textarea-sm",
      md: "textarea-md",
      lg: "textarea-lg",
      xl: "textarea-xl",
      ghost: "textarea-ghost",
      neutral: "textarea-neutral",
      primary: "textarea-primary",
      secondary: "textarea-secondary",
      accent: "textarea-accent",
      info: "textarea-info",
      success: "textarea-success",
      warning: "textarea-warning",
      error: "textarea-error"
    )
  end
end

