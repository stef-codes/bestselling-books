class CLI
    def run
        puts ""
        puts "Need a New Book for your Book Club?"
        sleep(1)
        puts " "
        puts '------------------------------------------------'
        puts "Here are 100 books to choose from:"            
        puts '------------------------------------------------'
        Scraper.scrape_book_list
        print_books
        puts " "
        puts "What a great list!"
        puts " "
    #loop that asks user what to do and does it over until exit 
        puts "---------------Menu--------------"
        puts "1. Select a number (1-100) to see more details about the books for your Book Club" 
        puts "2. Type 'list' to view all of the books again"
        puts "3. Type 'exit' to leave the application"
        puts "---------------------------------"
         input = gets.strip
         while input.downcase != "exit" do 
            if input.to_i <= 100 && input.to_i > 0
                book = Book.all[input.to_i - 1]
                Scraper.scrape_book_details(book) if !book.author 
                print_book_details(book)
            elsif input.downcase == "list"
                print_books
            else 
                puts " "
                puts "Oops! Did you mean to type something else?"
            end
            puts " "    
            puts "Menu: Type a number (1-100) to see another book, type 'list', or type 'exit'"
            input = gets.strip
         end    
        puts " "
        puts "Hope you found a great book to share! Goodbye!"
    end
    
    
#first level 
    def print_books     
        Book.all.each_with_index do |book, index| 
            puts "#{index+ 1}. #{book.name}" 
            sleep(0.15)
        end
    end
    
#second level details
    def print_book_details(book)
        puts " "
        puts "Your Book Club will LOVE This Choice:"
        puts " "
        puts "#{book.name.upcase.colorize(:blue)}"
        sleep(0.3)
        puts "  Author: #{book.author.colorize(:blue)}"
        puts "  Rating: #{book.rating}"
        puts "---------------Description--------------"
        puts " "
        puts "#{book.description}"
        puts "Learn more about the book here: https://www.goodreads.com#{book.url} "
        puts " "
    end 
end