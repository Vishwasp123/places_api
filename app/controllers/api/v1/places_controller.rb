class Api::V1::PlacesController < ApplicationController
	before_action :set_palce, only: %i[show update destroy]

	

	def index 
		@places = Place.includes(:images)
		render json: @places.as_json(include: { images: {only: %w[id url]} } )
	end

	

	def show
		render json: @place.as_json(include: { images: {only: %w[id url] } } )  
	end

	


	def create
		@place = Place.new(place_params)
		if @place.save
			render json: @place.as_json(include: { images: {only: %w[url] } } ) 
		else
			render json: @place.errors, status: :unprocessable_entity
		end
	end

	

	def update
		if @place.update(place_params)
			render json: @place.as_json(include: { images: {only: %w[url] } } )
		else
			render json: @place.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@place.destroy
		render json: {status: 'success', message: "Place has been deleted successfully"}
	end

	private
	def set_palce	
		@place = Place.find(params[:id])
	rescue ActiveRecord::RecordNotFound => e  
		render json: {message: e.message, status: "failed"}
	end
	def place_params
		params.require(:place).permit(:name, :description, :latitude, :longitude, :state, :city, :country, :image_url, images_attributes: [:id, :url])
	end

end
