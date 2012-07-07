task :populate => :environment do
  relation = YAML.load(File.read(File.join(Rails.root, 'config/companies.yml')))
  relation.each do |company_name,dudes|
    company = Company.find_or_create_by_name(company_name)
    puts "[#{company.name}]"
    dudes.each do |dude_username|
      dude = company.dudes.find_or_create_by_username(dude_username)
      puts "  #{dude.username}"
      Twitter.user_timeline(dude.username, :count => 200).each do |tweet|
        if tweet.in_reply_to_status_id
          dude.mentions.create :body => tweet.text, :created_at => tweet.created_at
        else
          dude.tweets.create :body => tweet.text, :created_at => tweet.created_at
        end
      end
    end
  end
end

task :reset => :environment do
  Tweet.destroy_all
  Mention.destroy_all
end