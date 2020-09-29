RSpec.describe LogParser do

  let(:log_file) { 'spec/fixtures/log_sample.log' }
  let(:bad_log_ip) { 'spec/fixtures/bad_ip_sample.log'}
  let(:bad_log_path) { 'spec/fixtures/bad_path_sample.log'}
  let(:bad_path) { 'spec/path_doesnt_exist' }

  subject { described_class.new(log_file)}
  
  describe '#parse' do
    let(:log_sample) do
      {
        '/about' => ['138.222.28.220', '228.32.104.207', '225.183.113.22'],
        '/contact/' => ['245.141.61.189', '61.64.28.106', '19.47.73.203'],
        '/home' => ['225.183.113.22', '225.183.113.22', '245.141.61.189', '225.183.113.22', '225.183.113.22'],
        '/index' => ['122.255.244.161', '122.255.244.161', '122.255.244.161'],
        '/products/3' => ['138.222.28.220'],
        '/products/2' => ['225.183.113.22', '83.104.119.23', '155.231.213.36'],
        'products/1' => ['117.198.72.249']
      }
    end

    let(:bad_sample) { {} }

    it 'receives a log as argument' do
      expect { described_class.new(log_file) }.not_to raise_error
    end

    it 'throws an error when a log file not valid path is given' do
      expect { described_class.new(bad_path) }.to raise_error(RuntimeError)
    end

    it 'throws an error when no log is given' do
      expect { described_class.new }.to raise_error(ArgumentError)
    end

    it 'creates key-pair values when good data file is provided' do
      expect(subject.parse).to eq(log_sample)
    end

    it 'does not parse logs with bad ip values' do
      bad_ip_subject = described_class.new(bad_log_ip)
      expect(bad_ip_subject.parse).to eq(bad_sample)
    end

    it 'does not parse logs with no path or bad formatted paths' do
      bad_path_subject = described_class.new(bad_log_path)
      expect(bad_path_subject.parse).to eq(bad_sample)
    end
  end

  describe '#most_views' do
    let(:most_viewed) do
      {
        '/about' => 3,
        '/contact/' => 3,
        '/home' => 5,
        '/index' => 3,
        '/products/3' => 1,
        '/products/2' => 3,
        'products/1' => 1
      }
    end

    it 'list webpages with most views from top to bottom' do
      expect(subject.most_views).to eq(most_viewed)
    end
  end

  describe '#unique_views' do
    let(:most_unique_viewed) do
      {
        '/about' => 3,
        '/contact/' => 3,
        '/home' => 2,
        '/index' => 1,
        '/products/3' => 1,
        '/products/2' => 3,
        'products/1' => 1
      }
    end

    it 'list webpages with most unique views from top to bottom' do
      expect(subject.unique_views).to eq(most_unique_viewed)
    end
  end
end
