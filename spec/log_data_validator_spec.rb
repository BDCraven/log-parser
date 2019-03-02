require 'log_data_validator'

describe LogDataValidator do
  let(:log_data) { "/help_page/1 126.318.035.038\n/contact 184.123.665.067\n/home 184.123.665.067\n/about/2 444.701.448.104\n" }
  subject { described_class.new }

  describe '#validate_log_data' do
    context 'with correct data' do
      it 'returns an array of lines' do
        expect(subject.validate(log_data)).to eq([["/help_page/1", "126.318.035.038"], ["/contact", "184.123.665.067"], ["/home", "184.123.665.067"], ["/about/2", "444.701.448.104"]])
      end
    end

    context 'with incorrect data' do
      let(:log_data) { "This data is invalid" }
      it 'raises an error' do
        expect { subject.validate(log_data) }.to raise_error(LogDataValidator::LogDataError)
      end
    end
  end
end
