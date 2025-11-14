# frozen_string_literal: true

module PhlexyUI
  class Swap < Base
    def initialize(*, as: :label, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :swap,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def on(**options, &)
      generate_classes!(
        component_html_class: :"swap-on",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def off(**options, &)
      generate_classes!(
        component_html_class: :"swap-off",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      rotate: "swap-rotate",
      flip: "swap-flip",
      active: "swap-active"
    )
  end
end

