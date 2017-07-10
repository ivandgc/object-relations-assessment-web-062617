require 'pry'

class Restaurant
  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.find {|restaurant| restaurant.name == name}
  end

  def customers
    Review.all.collect {|review| review.customer if review.restaurant == self}.compact
  end

  def reviews
    Review.all.select {|review| review.restaurant == self}
  end

end
