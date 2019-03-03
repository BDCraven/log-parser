require 'parser'

describe Parser do
  let(:log_data) { "/help_page/1 126.318.035.038\n/contact 184.123.665.067\n/home 184.123.665.067\n/about/2 444.701.448.104\n" }
  subject { described_class.new(log_data) }

  it 'has log data' do
    expect(subject.log_data).to eq(log_data)
  end

  describe '#call' do
    context 'with correct data' do
      it 'outputs the correct results' do
        expect { subject.call }.to output(<<~HEREDOC).to_stdout
        /about/2 1 visits
        /home 1 visits
        /contact 1 visits
        /help_page/1 1 visits
        /about/2 1 unique views
        /home 1 unique views
        /contact 1 unique views
        /help_page/1 1 unique views
        HEREDOC
      end
    end

    context 'with incorrect data' do
      let(:log_data) { "This data is invalid" }
      it 'raises an error' do
        expect { subject.call }.to raise_error(LogDataValidator::LogDataError)
      end
    end
  end
end
