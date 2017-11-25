class ArtBaselController < ApplicationController
  def index
  	@event = HTTParty.get("https://www.eventbrite.com/d/fl--miami/art-basel/?mode=search").parsed_response 
  	@info = Nokogiri::HTML(@event)
  end



end
