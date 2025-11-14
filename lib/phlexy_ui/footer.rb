# frozen_string_literal: true

module PhlexyUI
  class Footer < Base
    def initialize(*, as: :footer, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :footer,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def title(**options, &)
      generate_classes!(
        component_html_class: :"footer-title",
        options:
      ).then do |classes|
        span(class: classes, **options, &)
      end
    end
  end
end
