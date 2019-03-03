require 'parser_formatter'

describe ParserFormatter do
  let(:counted_webpage_views) { { "/about/2" => 2, "/contact" => 1, "/help_page/1" => 1, "/home" => 3 } }
  subject { described_class.new }

  describe '#print_webpages' do
    it 'returns a string of results' do
      expect { subject.printwebpages(counted_webpage_views) }
      .to output(<<~HEREDOC).to_stdout
        /about/2 2 visits
        /contact 1 visits
        /help_page/1 1 visits
        /home 3 visits
      HEREDOC
    end
  end

  describe '#print_unique_webpages' do
    it 'returns a string of results' do
      expect { subject.printuniquewebpages(counted_webpage_views) }
      .to output(<<~HEREDOC).to_stdout
        /about/2 2 unique views
        /contact 1 unique views
        /help_page/1 1 unique views
        /home 3 unique views
      HEREDOC
    end
  end

  describe '#sort_by_views_descending' do
    it 'returns an array of sorted results' do
      expect(subject.sort_by_views_descending(counted_webpage_views)).to eq(
        [["/home", 3], ["/about/2", 2], ["/help_page/1", 1], ["/contact", 1]]
      )
    end
  end
end
