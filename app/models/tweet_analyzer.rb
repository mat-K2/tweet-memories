require 'csv'

class TweetAnalyzer
  def self.analyze(csv_file)
    csv = CSV.read(csv_file.path, "r", {headers: true})
    tweets_monthly = csv.group_by { |tweet| tweet["timestamp"].match(/\A\d{4}-\d{2}/)[0] }
    tweets_monthly.map do |month, tweets|
      [month, YahooJA.keyphrase(tweets.map{ |tweet| tweet["text"] }.join.gsub(/@\w+/, ""))]
    end
  end
end
