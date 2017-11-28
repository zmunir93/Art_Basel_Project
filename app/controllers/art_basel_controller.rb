class ArtBaselController < ApplicationController
  class Entry
    def initialize(date, title, image, venue)
      @date = date
      @title = title
      @image = image
      @venue = venue
    end
    attr_reader :date
    attr_reader :title
    attr_reader :image
    attr_reader :venue
  end

  def home; end

  def artwork; end

  def index
    require 'open-uri'
    doc = Nokogiri::HTML(open('https://www.eventbrite.com/d/fl--miami/art-basel/?crt=regular&sort=date'))

    entries = doc.css('.search-date-group .list-card-v2')
    @entriesArray = []
    entries.each do |entry|
      date = entry.css('.list-card__date').text
      title = entry.css('.list-card__title').text
      image = entry.css('.js-poster-image')[0].attr('src')
      venue = entry.css('.list-card__venue').text
      @entriesArray << Entry.new(date, title, image, venue)
    end

    render 'index'
 end
end
