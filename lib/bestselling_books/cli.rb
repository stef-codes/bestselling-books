class CLI
    def run
        puts "Read these books at your next Book Club!"
        puts "These are the Top 10 books:"
        puts " "
        puts '------------------------------------------------'
        puts ' '
        Scraper.scrape_book_list
        # binding.pry
    
#loop that ask user what to do and does it over until exit 
        menu 
        print_books
    end
     
    def menu 

    end 

    def print_books     
       Book.all.each_with_index do |book, index| 
        puts "#{index+ 1}. #{book.name}" 
        end
    end     
end