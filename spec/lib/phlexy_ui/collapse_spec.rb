require "spec_helper"

describe PhlexyUI::Collapse do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="collapse"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      arrow: "collapse-arrow",
      plus: "collapse-plus",
      open: "collapse-open",
      close: "collapse-close"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="collapse #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:arrow, :open) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <div class="collapse collapse-arrow collapse-open"></div>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "title and content methods" do
    subject(:output) do
      render described_class.new(:arrow) do |collapse|
        collapse.title { "How do I create an account?" }
        collapse.content { "Click the Sign Up button" }
      end
    end

    it "renders title and content correctly" do
      expected_html = html <<~HTML
        <div class="collapse collapse-arrow">
          <div class="collapse-title">How do I create an account?</div>
          <div class="collapse-content">Click the Sign Up button</div>
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :details) }

    it "renders the collapse as the given tag" do
      expected_html = html <<~HTML
        <details class="collapse"></details>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

