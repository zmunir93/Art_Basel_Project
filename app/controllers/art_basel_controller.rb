class ArtBaselController < ApplicationController
	class Entry
	    def initialize(title, link, image)
	      @title = title
	      @link = link
	      @image = image
	    end
	    attr_reader :title
	    attr_reader :link
	    attr_reader :image
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
	      @entriesArray << Entry.new(title, link, image)
	    end

	  render 'index'
 end
end
