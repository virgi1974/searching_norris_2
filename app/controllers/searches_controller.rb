class SearchesController < ApplicationController

  CHUCK_CATEGORIES = ["animal",
                      "career",
                      "celebrity",
                      "dev",
                      "explicit",
                      "fashion",
                      "food",
                      "history",
                      "money",
                      "movie",
                      "music",
                      "political",
                      "religion",
                      "science",
                      "sport",
                      "travel"]

  # GET /searches or /searches.json
  def index
    @search = params["search"]
    if @search.present?
      client = Client.new(@search)
      response = client.call

      new_results = StoreSearch.new(@search, response).run
      if new_results
        scope_to_use = client.find_search_key || "random"

        if scope_to_use == "category"
          searches = Search.with_category(@search["category"])
          @searches = Search.paginate(page: params[:page], per_page: 5).where(id: searches.map(&:id))
          # TODO recover former sintax
          # @searches = Search.paginate(page: params[:page], per_page: 5)
          #                   .with_category(@search["category"])
        elsif scope_to_use == "text"
          @searches = Search.paginate(page: params[:page], per_page: 5)
                            .with_text(@search["text"])
        elsif scope_to_use == "random"
          @searches = Search.paginate(page: params[:page], per_page: 5)
                            .created_randomly
        else
          @searches = Search.paginate(page: params[:page], per_page: 5)
        end
      else
        @searches = Search.paginate(page: params[:page], per_page: 5)
      end
    end
    
    @searches ||= Search.paginate(page: params[:page], per_page: 5)
    @search = Search.new()
  end

  private

    def search_params
      params.require(:search).permit(:category, :text, :email)
    end
end
