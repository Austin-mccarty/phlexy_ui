# frozen_string_literal: true

module PhlexyUI
  class Hero < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :hero,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def content(**options, &)
      generate_classes!(
        component_html_class: :"hero-content",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def overlay(**options, &)
      generate_classes!(
        component_html_class: :"hero-overlay",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end
  end
end

