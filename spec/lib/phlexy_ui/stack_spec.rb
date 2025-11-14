require "spec_helper"

describe PhlexyUI::Stack do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="stack"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with content" do
    subject(:output) do
      render_class = Class.new(Phlex::HTML) do
        def view_template
          render PhlexyUI::Stack.new do
            div(class: "card") { "Card 1" }
            div(class: "card") { "Card 2" }
            div(class: "card") { "Card 3" }
          end
        end
      end
      render render_class.new
    end

    it "renders stack with cards" do
      expected_html = html <<~HTML
        <div class="stack">
          <div class="card">Card 1</div>
          <div class="card">Card 2</div>
          <div class="card">Card 3</div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

