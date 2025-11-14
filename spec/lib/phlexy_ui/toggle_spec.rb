require "spec_helper"

describe PhlexyUI::Toggle do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <input type="checkbox" class="toggle">
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      xs: "toggle-xs",
      sm: "toggle-sm",
      md: "toggle-md",
      lg: "toggle-lg",
      xl: "toggle-xl",
      neutral: "toggle-neutral",
      primary: "toggle-primary",
      secondary: "toggle-secondary",
      accent: "toggle-accent",
      info: "toggle-info",
      success: "toggle-success",
      warning: "toggle-warning",
      error: "toggle-error"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <input type="checkbox" class="toggle #{css}">
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:primary, :lg) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <input type="checkbox" class="toggle toggle-primary toggle-lg">
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "with checked attribute" do
    subject(:output) { render described_class.new(:primary, checked: true) }

    it "renders with the attribute" do
      expected_html = html <<~HTML
        <input type="checkbox" class="toggle toggle-primary" checked>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

