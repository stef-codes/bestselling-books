class Book
    attr_accessor :name, :url, :author, :description, :rating

    @@all = []

     
    def initialize
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

end 