# frozen_string_literal: true

module PhlexyUI
  class Rating < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :rating,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    register_modifiers(
      xs: "rating-xs",
      sm: "rating-sm",
      md: "rating-md",
      lg: "rating-lg",
      xl: "rating-xl",
      half: "rating-half"
    )
  end
end
