require "spec_helper"

describe PhlexyUI::Steps do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <ul class="steps"></ul>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      vertical: "steps-vertical",
      horizontal: "steps-horizontal"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <ul class="steps #{css}"></ul>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "step method" do
    subject(:output) do
      render_class = Class.new(Phlex::HTML) do
        def view_template
          render PhlexyUI::Steps.new do |steps|
            steps.step(class: "step-primary") { "Register" }
            steps.step(class: "step-primary") { "Choose plan" }
            steps.step { "Purchase" }
          end
        end
      end
      render render_class.new
    end

    it "renders steps correctly" do
      expected_html = html <<~HTML
        <ul class="steps">
          <li class="step step-primary">Register</li>
          <li class="step step-primary">Choose plan</li>
          <li class="step">Purchase</li>
        </ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end
