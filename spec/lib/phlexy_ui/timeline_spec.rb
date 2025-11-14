require "spec_helper"

describe PhlexyUI::Timeline do
  subject(:output) { render described_class.new }

  it "is expected to match the formatted HTML" do
    expected_html = html <<~HTML
      <ul class="timeline"></ul>
    HTML

    is_expected.to eq(expected_html)
  end

  describe "conditions" do
    {
      vertical: "timeline-vertical",
      horizontal: "timeline-horizontal",
      snap: "timeline-snap",
      compact: "timeline-compact"
    }.each do |modifier, css|
      context "when given :#{modifier} modifier" do
        subject(:output) { render described_class.new(modifier) }

        it "renders it apart from the main class" do
          expected_html = html <<~HTML
            <ul class="timeline #{css}"></ul>
          HTML

          expect(output).to eq(expected_html)
        end
      end
    end
  end

  describe "helper methods" do
    subject(:output) do
      render_class = Class.new(Phlex::HTML) do
        def view_template
          render PhlexyUI::Timeline.new do |timeline|
            timeline.item do
              hr
              timeline.start { "1984" }
              timeline.middle { "●" }
              timeline.end_ { "Event" }
              hr
            end
          end
        end
      end
      render render_class.new
    end

    it "renders timeline with items" do
      expected_html = html <<~HTML
        <ul class="timeline">
          <li>
            <hr>
            <div class="timeline-start">1984</div>
            <div class="timeline-middle">●</div>
            <div class="timeline-end">Event</div>
            <hr>
          </li>
        </ul>
      HTML

      expect(output).to eq(expected_html)
    end
  end
end

