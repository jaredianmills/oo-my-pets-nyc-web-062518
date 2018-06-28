require "pry"

class Owner

  attr_accessor :name, :pets
  attr_reader :species

  def initialize(species)
    @species = species
    @@all << self
    self.pets = {:fishes => [], :dogs => [], :cats => []}
  end

  @@all = []

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    new_fish = Fish.new(name)
    self.pets[:fishes] << new_fish
  end

  def buy_dog(name)
    new_dog = Dog.new(name)
    self.pets[:dogs] << new_dog
  end

  def buy_cat(name)
    new_cat = Cat.new(name)
    self.pets[:cats] << new_cat
  end

  def walk_dogs
    self.pets[:dogs].map! {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats].map! {|cat| cat.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes].map! {|fish| fish.mood = "happy"}
  end

  def sell_pets
    self.pets = self.pets.each_value do |type_of_pet|
      type_of_pet.each {|pet| pet.mood = "nervous"}
    end
    self.pets = self.pets.each_value {|type_of_pet| type_of_pet.clear}
  end

  def list_pets
    number_of_dogs = self.pets[:dogs].count
    number_of_cats = self.pets[:cats].count
    number_of_fishes = self.pets[:fishes].count
    "I have #{number_of_fishes} fish, #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
  end

end
