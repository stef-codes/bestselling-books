class CLI
    def run
        puts "Need a New Book for your Book Club?"
        puts "Here are 100 books to choose from:"
        puts " "
        puts '------------------------------------------------'
        puts ' '
        Scraper.scrape_book_list
        print_books
        #  binding.pry
        puts " "
#loop that ask user what to do and does it over until exit 
        puts "Select a number to see more details about the books for your Book Club 
        or type 'exit' to exit"
         input = gets.strip
         while input.downcase != "exit" do 
            if input.to_i <= 100 && input.to_i > 0
                book = Book.all[input.to_i - 1]
                # binding.pry
                Scraper.scrape_book_details(book) if !book.author 
                
                print_book_details(book)
            elsif input.downcase == "list"
                print_books
            else 
                puts " "
                puts "I don't understand"
            end
            puts "Please input a book number, type 'list', or type 'exit'"
            input = gets.strip
         end    
        # menu 
        # print_books

    end
     
    # def menu 

    # end 

    def print_books     
       Book.all.each_with_index do |book, index| 
        puts "#{index+ 1}. #{book.name}" 
        sleep(0.15)
        end
    end  
    
    def print_book_details(book)
        puts "Your Book Club will Love This Choice:"
        puts "#{book.name.upcase}!"
        puts "  Author: #{book.author}"
        puts "  Rating: #{book.rating}"
        puts "  Here's a brief description:"
        puts "  #{book.description}"
        puts "What do you think?"
        puts "Learn more about the book here: https://www.goodreads.com#{book.url} "
    end 
end