require "spec_helper"

describe PhlexyUI::Countdown do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <span class="countdown"></span>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with content" do
    subject(:output) do
      render_class = Class.new(Phlex::HTML) do
        def view_template
          render PhlexyUI::Countdown.new(class: "font-mono text-2xl") do
            span style: "--value:15;"
          end
        end
      end
      render render_class.new
    end

    it "renders countdown with value" do
      expected_html = html <<~HTML
        <span class="countdown font-mono text-2xl">
          <span style="--value:15;"></span>
        </span>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

