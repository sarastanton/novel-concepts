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
    endpoint = 'https://api.census.gov/data/2010/surname?get=NAME&RANK=1:1000'
    uri = URI.parse(URI.encode(endpoint))
    api_response = Net::HTTP.get(uri)
    JSON.parse(api_response)
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
    all_last_names.shift
    all_last_names.each do |name|
      @@last_names << name.first
    end
  end

  def self.properly_capitalize(string)
    name = string.downcase
    name[0] = name[0].upcase
    name
  end

  def self.generate_male_name
    first_name_index = rand(@@male_first_names.length)
    last_name_index = rand(@@male_first_names.length)

    first_name = properly_capitalize(@@male_first_names[first_name_index])
    last_name = properly_capitalize(@@last_names[last_name_index])

    [first_name, " ", last_name]
  end

  def self.generate_female_name
    first_name_index = rand(@@female_first_names.length)
    last_name_index = rand(@@female_first_names.length)

    first_name = properly_capitalize(@@female_first_names[first_name_index])
    last_name = properly_capitalize(@@last_names[last_name_index])

    [first_name, " ", last_name]
  end

  def self.male_first_names
    @@male_first_names
  end

  def self.female_first_names
    @@female_first_names
  end

  def self.last_names
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
