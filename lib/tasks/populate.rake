desc 'Huge hack to populate with tweets that rescues from server error'
task :populate => :environment do
  relation = YAML.load(File.read(File.join(Rails.root, 'config/companies.yml')))
  relation.each do |company_name,dudes|
    company = Company.find_or_create_by_name(company_name)
    puts "[#{company.name}]"
    dudes.each do |dude_username|
      dude = company.dudes.find_or_create_by_username(dude_username)
      puts "  #{dude.username}"
      tweets = Twitter.user_timeline(dude.username, :count => 200)
      begin
        tweets.each do |tweet|
          tweet_params = [tweet.id.to_s, {:body => tweet.text, :created_at => tweet.created_at}]
          resource = tweet.in_reply_to_status_id ? :mentions : :tweets
          dude.send(resource).find_or_create_by_twitter_id *tweet_params
        end
      rescue 
        retry;next
      end
    end
  end
end

desc 'Destroy all the registers!'
task :reset => :environment do
  Company.destroy_all
  Dude.destroy_all
  Tweet.destroy_all
  Mention.destroy_all
end