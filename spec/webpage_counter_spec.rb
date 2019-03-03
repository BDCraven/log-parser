require 'webpage_counter'

describe WebpageCounter do
  let(:log_lines) {
    [
      ["/help_page/1", "126.318.035.038"],
      ["/contact", "184.123.665.067"],
      ["/home", "184.123.665.067"],
      ["/home", "444.701.448.104"],
      ["/home", "184.123.665.067"],
      ["/about/2", "444.701.448.104"],
      ["/about/2", "184.123.665.067"]
    ]
  }

  let(:sum_ip_addresses_by_webpage) {
    {
      "/about/2"=>{"184.123.665.067"=>1, "444.701.448.104"=>1},
      "/contact"=>{"184.123.665.067"=>1},
      "/help_page/1"=>{"126.318.035.038"=>1},
      "/home"=>{"184.123.665.067"=>2, "444.701.448.104"=>1}
    }
  }
  subject { described_class.new }

  it 'returns a hash of counted webpages views' do
    subject.count_ip_addresses_by_webpage(log_lines)
    expect(subject.sum_ip_addresses_by_webpage).to eq(sum_ip_addresses_by_webpage)
  end

  describe '#total_views_per_webpage' do
    it 'returns a hash of total views per webpage' do
      expect(subject.total_views_per_webpage(sum_ip_addresses_by_webpage)).to eq(
        { "/about/2"=>2, "/contact"=>1, "/help_page/1"=>1, "/home"=>3 }
      )
    end
  end

  describe '#total_unique_views_per_webpage' do
    it 'returns a hash of total unique views per webpage' do
      expect(subject.total_unique_views_per_webpage(sum_ip_addresses_by_webpage)).to eq(
        { "/about/2"=>2, "/contact"=>1, "/help_page/1"=>1, "/home"=>2 }
      )
    end
  end
end
