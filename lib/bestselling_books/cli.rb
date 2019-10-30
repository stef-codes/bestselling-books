class CLI
    def run
        puts "Check out the Bestselling Books of 2019 (so far)!"
        puts "These are the Top 10 books:"
        puts " "
        puts '------------------------------------------------'
        puts ' '
            binding.pry
        html = open("https://www.goodreads.com/list/show/19.Best_for_Book_Clubs")
        doc = Nokogiri::HTML(html)
          binding.pry
    end 
end