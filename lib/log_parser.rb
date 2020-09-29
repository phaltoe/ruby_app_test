require 'ipaddr'
class LogParser

  attr_reader :logfile, :records

  def initialize(logfile)
    no_or_bad_logfile_given?(logfile)
    @logfile = logfile
    @records = Hash.new { |hash, key | hash[key] = []}
  end

  def parse
    File.open(logfile).each do |record|
      path, ip = record.split(' ')

      begin
        ip_checker = IPAddr.new(ip)
      rescue
        next
      end

      if path.nil? or ip.nil? or !ip_checker.ipv4? or !valid_path(path)
        next
      end
      records[path] << ip
    end
    records
  end

  def most_views
    most_views = generate_views(unique: false) if most_views.nil?
    print_form(most_views, "views")
  end

  def unique_views
    unique_views = generate_views(unique: true) if unique_views.nil?
    print_form(unique_views, "unique views")
  end

  private

  def valid_path(path)
    path.match(/\A(?:\/?+[0-9a-zA-Z\_\-]+\/?)/)
  end

  def generate_views(unique: nil)
    self.parse
    list = records.map do |record, value|
      if unique == true
        [record, value.uniq.size]
      else
        [record, value.size]
      end
    end

    list.sort_by { |record, value| value}.reverse.to_h
  end

  def print_form(list, text)
    list.each do |path, views|
      puts "#{path} - #{views} #{text}"
    end
  end

  def no_or_bad_logfile_given?(logfile)
    raise  "Please provide a valid file" unless File.exist?(logfile)
  end
end