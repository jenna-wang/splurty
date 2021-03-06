class QuotesController < ApplicationController
	
	#INDEX
	def index
		@quote = Quote.order("RANDOM()").first
	end

	#CREATE
	def create
		@quote = Quote.create(quote_params)
		
		if @quote.invalid?
			flash[:error] = '<strong>Could not save,</strong> the data you entered is invalid. Please try again.'
			redirect_to root_path
		end
	end

	#ABOUT
	def about
	end

	#PARAMS FOR NEW QUOTE
	private

	def quote_params
		params.require(:quote).permit(:saying, :author)
	end
end
