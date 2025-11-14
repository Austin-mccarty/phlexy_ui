require "spec_helper"

describe PhlexyUI::Rating do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <div class="rating"></div>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      xs: "rating-xs",
      sm: "rating-sm",
      md: "rating-md",
      lg: "rating-lg",
      xl: "rating-xl",
      half: "rating-half"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <div class="rating #{css}"></div>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end

    context "when given multiple conditions" do
      subject(:output) { render described_class.new(:lg, :half) }

      it "renders them separately" do
        expected_html = html <<~HTML
          <div class="rating rating-lg rating-half"></div>
        HTML

        expect(output).to eq(expected_html)
      end
    end
  end

  describe "with inputs" do
    subject(:output) do
      render_class = Class.new(Phlex::HTML) do
        def view_template
          render PhlexyUI::Rating.new(:lg) do
            input type: :radio, name: "rating-1", class: "mask mask-star-2"
            input type: :radio, name: "rating-1", class: "mask mask-star-2", checked: true
            input type: :radio, name: "rating-1", class: "mask mask-star-2"
          end
        end
      end
      render render_class.new
    end

    it "renders with rating inputs" do
      expected_html = html <<~HTML
        <div class="rating rating-lg">
          <input type="radio" name="rating-1" class="mask mask-star-2">
          <input type="radio" name="rating-1" class="mask mask-star-2" checked>
          <input type="radio" name="rating-1" class="mask mask-star-2">
        </div>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

