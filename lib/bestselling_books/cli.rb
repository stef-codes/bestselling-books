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
        end
    end  
    
    def print_book_details(book)
        puts "I am a book!"
        puts "author: #{book.author}"
    end 
end