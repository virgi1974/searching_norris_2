class StoreSearch
  attr_reader :search, :response

  def initialize(search, response)
    @search = search
    @response = response
  end

  def run
    if response.key?("total") && response["total"] > 0
      store_collection
    elsif response.key?("total") && response["total"] == 0
      true     
    else
      store_one(response)
    end
  rescue => e
    #TODO
  end

  def store_one(response_obj)
    Search.new(category: @search["category"], 
               text:     @search["text"],
               email:    @search["email"],
               data:     response_obj).save!
  end

  def store_collection
    response["result"].each do |response_obj|
      store_one(response_obj)
    end
  end
  
end