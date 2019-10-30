class CLI
    def run
        binding.pry
        puts "Check out the Bestselling Books of 2019 (so far)!"
        puts "These are the Top 10 books:"
        puts " "
        puts '------------------------------------------------'
        puts ' '

        html = open("https://www.amazon.com/gp/bestsellers/2019/books")
        doc = Nokogiri::HTML(html)
         binding.pry
    end 
end