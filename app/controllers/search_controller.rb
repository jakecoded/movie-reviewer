class SearchController < ApplicationController
	before_action :set_movie_search, only: [:index]

	def index
    	@movie_results = Movie.search @search_movie, fields: [:title]
	end

	private

	def set_movie_search
		@search_movie = params[:search_movie]
	end

end
