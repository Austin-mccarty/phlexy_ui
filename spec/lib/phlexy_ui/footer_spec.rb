require "spec_helper"

describe PhlexyUI::Footer do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <footer class="footer"></footer>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "with title" do
    subject(:output) do
      render_class = Class.new(Phlex::HTML) do
        def view_template
          render PhlexyUI::Footer.new do |footer|
            footer.title { "Services" }
          end
        end
      end
      render render_class.new
    end

    it "renders footer with title" do
      expected_html = html <<~HTML
        <footer class="footer">
          <span class="footer-title">Services</span>
        </footer>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

