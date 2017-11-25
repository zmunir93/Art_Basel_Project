class ArtBaselController < ApplicationController
  def index
  	@event = HTTParty.get("https://www.eventbrite.com/d/fl--miami/art-basel/?mode=search")
  	@info = Nokogiri::HTML(@event.body)
 	p @info
  end



end
