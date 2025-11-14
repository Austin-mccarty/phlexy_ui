require "spec_helper"

describe PhlexyUI::Hero do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="hero"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "helper methods" do
    subject(:output) do
      render_class = Class.new(Phlex::HTML) do
        def view_template
          render PhlexyUI::Hero.new do |hero|
            hero.content do
              h1 { "Hello World" }
            end
          end
        end
      end
      render render_class.new
    end

    it "renders hero with content" do
      expected_html = html <<~HTML
        <div class="hero">
          <div class="hero-content">
            <h1>Hello World</h1>
          </div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

