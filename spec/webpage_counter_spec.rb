require 'webpage_counter'

describe WebpageCounter do
  let(:log_lines) {
    [
      ["/help_page/1", "126.318.035.038"],
      ["/contact", "184.123.665.067"],
      ["/home", "184.123.665.067"],
      ["/about/2", "444.701.448.104"],
      ["/about/2", "444.701.448.104"],
      ["/about/2", "184.123.665.067"]
    ]
  }
  subject { described_class.new }

  it 'returns a hash of counted webpages' do
    subject.webpage_counts_by_ip_address(log_lines)
    expect(subject.page_views).to eq(
      {
        "/about/2"=>{"184.123.665.067"=>1, "444.701.448.104"=>2},
        "/contact"=>{"184.123.665.067"=>1},
        "/help_page/1"=>{"126.318.035.038"=>1},
        "/home"=>{"184.123.665.067"=>1}
      }
    )
  end
end
