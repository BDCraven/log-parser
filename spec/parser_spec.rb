require 'parser'

describe Parser do
  let(:log_data) { "/help_page/1 126.318.035.038\n/contact 184.123.665.067\n/home 184.123.665.067\n/about/2 444.701.448.104\n" }
  subject { described_class.new(log_data) }

  it 'has log data' do
    expect(subject.log_data).to eq(log_data)
  end
end
