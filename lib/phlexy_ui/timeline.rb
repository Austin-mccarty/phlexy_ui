# frozen_string_literal: true

module PhlexyUI
  class Timeline < Base
    def initialize(*, as: :ul, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :timeline,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def item(**options, &)
      li(**options, &)
    end

    def start(**options, &)
      generate_classes!(
        component_html_class: :"timeline-start",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def middle(**options, &)
      generate_classes!(
        component_html_class: :"timeline-middle",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def end_(**options, &)
      generate_classes!(
        component_html_class: :"timeline-end",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def box(**options, &)
      generate_classes!(
        component_html_class: :"timeline-box",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      vertical: "timeline-vertical",
      horizontal: "timeline-horizontal",
      snap: "timeline-snap",
      compact: "timeline-compact"
    )
  end
end
