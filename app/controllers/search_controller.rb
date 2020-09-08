class SearchController < ApplicationController

    def search
        @movies = params[:q].nil? ? [] : Movie.search(params[:q])
    end

end
