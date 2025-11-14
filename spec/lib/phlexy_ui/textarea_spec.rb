require "spec_helper"

describe PhlexyUI::Textarea do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <textarea class="textarea"></textarea>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      xs: "textarea-xs",
      sm: "textarea-sm",
      md: "textarea-md",
      lg: "textarea-lg",
      xl: "textarea-xl",
      ghost: "textarea-ghost",
      neutral: "textarea-neutral",
      primary: "textarea-primary",
      secondary: "textarea-secondary",
      accent: "textarea-accent",
      info: "textarea-info",
      success: "textarea-success",
      warning: "textarea-warning",
      error: "textarea-error"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <textarea class="textarea #{css}"></textarea>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:primary, :lg) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <textarea class="textarea textarea-primary textarea-lg"></textarea>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "with placeholder attribute" do
    subject(:output) { render described_class.new(:primary, placeholder: "Enter bio") }

    it "renders with the attribute" do
      expected_html = html <<~HTML
        <textarea class="textarea textarea-primary" placeholder="Enter bio"></textarea>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

