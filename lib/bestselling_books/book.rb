class Book
    attr_accessor :name, :url

    @@all = []

    def initialize (name,url)
    @@all << self 
    @name = name
    @url = url
    end 

    def self.all 
    @@all 
    end 

end 