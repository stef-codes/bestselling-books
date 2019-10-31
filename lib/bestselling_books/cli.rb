class CLI
    def run
        puts "Read these books at your next Book Club!"
        puts "These are the Top 100 books:"
        puts " "
        puts '------------------------------------------------'
        puts ' '
        Scraper.scrape_book_list
        print_books
        #  binding.pry
        puts " "
#loop that ask user what to do and does it over until exit 
        puts "Select a number to see more details about the books for your book club 
        or type 'exit' to exit"
         input = gets.strip
         while input != "exit".downcase do 
             book = Book.all[input.to_i - 1]
             Scraper.scrape_book_details(book)
         end    
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
    
    def print_book_details
        
    end 
end