namespace :db do
  task :total_karma => :environment do
    User.find_in_batches(batch_size: 2000) do |group|
      group.each do |u|
        puts "updating #{u.id}"
        u.update_attribute :total_karma, u.karma_points.sum(:value)
      end
    end
  end


  task :save_karma => :environment do
    User.all.each do |u|
      puts "updating #{u.id}"
      u.update_attributes(total_karma: u.karma_points.sum(:value))
    end
  end
end