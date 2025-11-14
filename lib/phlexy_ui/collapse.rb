# frozen_string_literal: true

module PhlexyUI
  class Collapse < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :collapse,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def title(**options, &)
      generate_classes!(
        component_html_class: :"collapse-title",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def content(**options, &)
      generate_classes!(
        component_html_class: :"collapse-content",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      arrow: "collapse-arrow",
      plus: "collapse-plus",
      open: "collapse-open",
      close: "collapse-close"
    )
  end
end

