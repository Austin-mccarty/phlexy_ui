# frozen_string_literal: true

module PhlexyUI
  class Steps < Base
    def initialize(*, as: :ul, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :steps,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def step(**options, &)
      generate_classes!(
        component_html_class: :step,
        options:
      ).then do |classes|
        li(class: classes, **options, &)
      end
    end

    register_modifiers(
      vertical: "steps-vertical",
      horizontal: "steps-horizontal"
    )
  end
end
