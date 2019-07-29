# https://health.data.ny.gov/resource/jxy9-yhdk.json
require 'json'
require 'net/http'

class Name < ActiveRecord::Base
  @@male_first_names = []
  @@female_first_names = []
  @@last_names = []

  def self.get_first_names_from_api
    endpoint = 'https://health.data.ny.gov/resource/jxy9-yhdk.json'
    uri = URI.parse(URI.encode(endpoint))
    api_response = Net::HTTP.get(uri)
    JSON.parse(api_response)
  end

  def self.get_last_names_from_api
    endpoint = 'http://api.census.gov/data/2010/surname?get=NAME'
    uri = URI.parse(URI.encode(endpoint))
    Net::HTTP.get(uri)
  end

  def self.populate_first_names
    self.reset_first_names
    all_first_names = self.get_first_names_from_api
    all_first_names.each do |name|
      if name["sex"] == "M"
        @@male_first_names << name["first_name"]
      elsif name["sex"] == "F"
        @@female_first_names << name["first_name"]
      end
    end
  end

  def self.populate_last_names
    self.reset_last_names
    all_last_names = self.get_last_names_from_api
    all_last_names.shift.each do |name|
      @@last_names << name
    end
  end

  def self.generate_male_name
    first_name_index = rand(@@male_first_names.length)
    last_name_index = rand(@@male_first_names.length)

    first_name = @@male_first_names[first_name_index]
    last_name = @@last_names[last_name_index]

    [first_name, last_name]
  end

  def self.generate_female_name
    first_name_index = rand(@@female_first_names.length)
    last_name_index = rand(@@female_first_names.length)

    first_name = @@female_first_names[first_name_index]
    last_name = @@last_names[last_name_index]

    [first_name, " ", last_name]
  end


  def male_first_names
    @@male_first_names
  end

  def female_first_names
    @@female_first_names
  end

  def last_names
    @@last_names
  end

  def self.reset_first_names
    @@male_first_names = []
    @@female_first_names = []
  end

  def self.reset_last_names
    @@last_names = []
  end

end
