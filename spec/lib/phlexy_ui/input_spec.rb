require "spec_helper"

describe PhlexyUI::Input do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <input class="input">
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      xs: "input-xs",
      sm: "input-sm",
      md: "input-md",
      lg: "input-lg",
      xl: "input-xl",
      ghost: "input-ghost",
      neutral: "input-neutral",
      primary: "input-primary",
      secondary: "input-secondary",
      accent: "input-accent",
      info: "input-info",
      success: "input-success",
      warning: "input-warning",
      error: "input-error"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <input class="input #{css}">
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:primary, :lg) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <input class="input input-primary input-lg">
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "with type and placeholder" do
    subject(:output) { render described_class.new(:primary, type: :text, placeholder: "Enter text") }

    it "renders with the attributes" do
      expected_html = html <<~HTML
        <input class="input input-primary" type="text" placeholder="Enter text">
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

