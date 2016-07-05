require 'open-uri'
require 'csv'
namespace :agents do
  @file_url = ARGV[1] if ARGV[1]
  desc "Imports a url to a TSV file into Agents"
  task :import => :environment do |task, args|
    if ARGV[1].nil?
      puts "Please feed me a url to a file"
      exit 1
    end
    @file_url = ARGV[1]
    begin
      file_given = open(@file_url)
    rescue StandardError=>e
      puts "File cannot be opened, please check url"
      exit 1
    end
    outliers = []
    added = 0
    record_count = (file_given.readlines.size) - 1
    CSV.open(file_given, col_sep: "\t").each_with_index do |row, index|
      remaining_message = "#{record_count - (index + 1)} remaining \r"
      # headers: true kept throwing the whole file off, so this skips the headers
      next if index == 0

      # set fields' variables
      row_first_name, row_last_name, row_email, row_agent_mls, row_description, row_image_url, row_office_mls, row_phone_number, row_country_code = row

      agent = Agent.new(first_name: row_first_name,
        last_name: row_last_name,
        email: row_email,
        mls: row_agent_mls,
        description: row_description,
        image_url: row_image_url,
        phone_number: row_phone_number,
        country_code: row_country_code)

      unless row_office_mls.blank?
        office = Office.find_or_create_by(mls: row_office_mls)
        agent.assign_attributes(office_id: office.id)
      end

      if agent.save
        added += 1
      else
        outliers.push("-- ##{row_agent_mls} | #{row_email} --")
        outliers.push(agent.errors.full_messages)
      end
      print remaining_message
    end
    puts "Agent import complete. Added: #{added} out of #{record_count} records"
    puts "Skipped Records (Agent MLS | Agent Email): "
    outliers.each {|outlier| puts outlier}
  end
  # Quickly remove agents for import smoke testing
  desc "Removes all Agents"
  task :destroy => :environment do |task, args|
    Agent.delete_all
  end
end
# Add empty task to allow for an argument outside of an array
task :"#{file_url}"