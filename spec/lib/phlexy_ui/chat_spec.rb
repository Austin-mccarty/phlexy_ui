require "spec_helper"

describe PhlexyUI::Chat do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="chat"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      start: "chat-start",
      end: "chat-end"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="chat #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "helper methods" do
    subject(:output) do
      render_class = Class.new(Phlex::HTML) do
        def view_template
          render PhlexyUI::Chat.new(:start) do |chat|
            chat.header { "John" }
            chat.bubble { "Hello!" }
            chat.footer { "Delivered" }
          end
        end
      end
      render render_class.new
    end

    it "renders chat with header, bubble, and footer" do
      expected_html = html <<~HTML
        <div class="chat chat-start">
          <div class="chat-header">John</div>
          <div class="chat-bubble">Hello!</div>
          <div class="chat-footer">Delivered</div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

