# frozen_string_literal: true

module PhlexyUI
  class Chat < Base
    def initialize(*, as: :div, **)
      super(*, **)
      @as = as
    end

    def view_template(&)
      generate_classes!(
        component_html_class: :chat,
        modifiers_map: modifiers,
        base_modifiers:,
        options:
      ).then do |classes|
        public_send(as, class: classes, **options, &)
      end
    end

    def image(**options, &)
      generate_classes!(
        component_html_class: :"chat-image",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def header(**options, &)
      generate_classes!(
        component_html_class: :"chat-header",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def bubble(**options, &)
      generate_classes!(
        component_html_class: :"chat-bubble",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    def footer(**options, &)
      generate_classes!(
        component_html_class: :"chat-footer",
        options:
      ).then do |classes|
        div(class: classes, **options, &)
      end
    end

    register_modifiers(
      start: "chat-start",
      end: "chat-end"
    )
  end
end

