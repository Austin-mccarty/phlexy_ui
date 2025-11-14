require "spec_helper"

describe PhlexyUI::Swap do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <label class="swap"></label>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      rotate: "swap-rotate",
      flip: "swap-flip",
      active: "swap-active"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <label class="swap #{css}"></label>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:rotate, :active) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <label class="swap swap-rotate swap-active"></label>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "on and off methods" do
    subject(:output) do
      render_class = Class.new(Phlex::HTML) do
        def view_template
          render PhlexyUI::Swap.new(:rotate) do |swap|
            input type: :checkbox
            swap.on { "ON" }
            swap.off { "OFF" }
          end
        end
      end
      render render_class.new
    end

    it "renders on and off content correctly" do
      expected_html = html <<~HTML
        <label class="swap swap-rotate">
          <input type="checkbox">
          <div class="swap-on">ON</div>
          <div class="swap-off">OFF</div>
        </label>
      HTML

      expect(output).to eq(expected_html)
    end
  end

  describe "passing :as option" do
    subject(:output) { render described_class.new(as: :div) }

    it "renders the swap as the given tag" do
      expected_html = html <<~HTML
        <div class="swap"></div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

