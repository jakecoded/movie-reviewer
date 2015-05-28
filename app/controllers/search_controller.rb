class SearchController < ApplicationController
	before_action :set_movie_search, only: [:index]
	helper_method :test

	def index
    	@movie_results = Movie.search @search_key, fields: [:title, :director]
	end

	private

	def set_movie_search
		@search_key = params[:search_movie]
	end

end
