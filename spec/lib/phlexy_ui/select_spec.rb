require "spec_helper"

describe PhlexyUI::Select do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <select class="select"></select>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      xs: "select-xs",
      sm: "select-sm",
      md: "select-md",
      lg: "select-lg",
      xl: "select-xl",
      ghost: "select-ghost",
      neutral: "select-neutral",
      primary: "select-primary",
      secondary: "select-secondary",
      accent: "select-accent",
      info: "select-info",
      success: "select-success",
      warning: "select-warning",
      error: "select-error"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <select class="select #{css}"></select>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:primary, :lg) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <select class="select select-primary select-lg"></select>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "with options" do
    subject(:output) do
      render_class = Class.new(Phlex::HTML) do
        def view_template
          render PhlexyUI::Select.new(:primary) do
            option { "Option 1" }
            option { "Option 2" }
          end
        end
      end
      render render_class.new
    end

    it "renders with options" do
      expected_html = html <<~HTML
        <select class="select select-primary">
          <option>Option 1</option>
          <option>Option 2</option>
        </select>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

