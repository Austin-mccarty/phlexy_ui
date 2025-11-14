require "spec_helper"

describe PhlexyUI::Range do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <input type="range" class="range">
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      xs: "range-xs",
      sm: "range-sm",
      md: "range-md",
      lg: "range-lg",
      xl: "range-xl",
      neutral: "range-neutral",
      primary: "range-primary",
      secondary: "range-secondary",
      accent: "range-accent",
      info: "range-info",
      success: "range-success",
      warning: "range-warning",
      error: "range-error"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <input type="range" class="range #{css}">
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:primary, :lg) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <input type="range" class="range range-primary range-lg">
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "with standard attributes" do
    subject(:output) { render described_class.new(:primary, min: 0, max: 100, value: 50) }

    it "renders with the attributes" do
      expected_html = html <<~HTML
        <input type="range" class="range range-primary" min="0" max="100" value="50">
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
