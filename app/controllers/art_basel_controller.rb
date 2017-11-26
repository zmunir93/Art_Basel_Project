class ArtBaselController < ApplicationController
	class Entry
	    def initialize(title, link, image, venue)
	      @title = title
	      @link = link
	      @image = image
	      @venue = venue
	    end
	    attr_reader :title
	    attr_reader :link
	    attr_reader :image
	    attr_reader :venue
  end

  def index
	    require 'open-uri'
	    doc = Nokogiri::HTML(open("https://www.eventbrite.com/d/fl--miami/art-basel/?crt=regular&sort=date"))

	    entries = doc.css('.search-date-group .list-card-v2')
	    @entriesArray = []
	    entries.each do |entry|
	      title = entry.css('.list-card__date').text
	      link = entry.css('.list-card__title').text
	      image = entry.css('.js-poster-image')[0].attr('src')
	      venue = entry.css('.list-card__venue').text
	      @entriesArray << Entry.new(title, link, image, venue)
	    end

	  render 'index'
 end
end
