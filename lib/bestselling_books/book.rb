class Book
    attr_accessor :name, :url, :author, :description, :rating

    @@all = []

     
    def initialize
    # @name = name
    # @url = url
    @@all << self 
    end 

    def self.all 
    @@all 
    end 

end 