require 'net/http'

class Client
  attr_reader :search
  
  CATEGORIES_URL = "https://api.chucknorris.io/jokes/random?category=".freeze
  TEXT_URL =       "https://api.chucknorris.io/jokes/search?query=".freeze
  RANDOM_URL =     "https://api.chucknorris.io/jokes/random".freeze

  def initialize(search)
    @search = search
  end
  
  def call    
    key_to_use = find_search_key

    case key_to_use
    when 'category'
      JSON.parse(fetch_by_category)
    when 'text'
      JSON.parse(fetch_by_text)
    when 'random'
      JSON.parse(fetch_by_random)
    else
      JSON.parse(fetch_by_random)
    end
  end
  
  def fetch_by_category
    url = CATEGORIES_URL + "#{search[:category]}"
    fetch_url(url)
  end
  
  def fetch_by_text
    url = TEXT_URL + "#{search[:text]}"
    fetch_url(url)
  end

  def fetch_by_random
    url = RANDOM_URL
    fetch_url(url)
  end

  def fetch_url(url)
    uri = URI(url)
    Net::HTTP.get(uri)
  end

  # def all_search_keys_empty?
  #   search.values.all? { |val| val.empty?}
  # end

  def find_search_key
    search.keys.detect { |key| !search[key].empty? } 
  end
end