class Scraper 
# base = https://www.goodreads.com/ 
# iterate over = 
# link =  [base] + doc.css("table tr")[1].css("a").attribute("href").value
# book = doc.css("table tr")[1].css("a span").children[0].text
# author = doc.css("table tr")[1].css("a span").children[1].text
#     end

# Method that scrapes and makes all book objects that know their own title and url
#     open and nokogiri on https://www.goodreads.com/list/show/19.Best_for_Book_Clubs
# #Method #2 someone want to see the details on a given book this method takes in the object that is a book that only knows title and url
#        open and nokogiri on https://www.goodreads.com +  that book's url
    def self.scrape_book_list
        html = open("https://www.goodreads.com/list/show/19.Best_for_Book_Clubs")
        doc = Nokogiri::HTML(html)
        # base = "https://www.goodreads.com"
    
        
       
        doc.css("table tr").each do |libro|  
            book = Book.new
            book.name = libro.css("a span").children[0].text 
            book.url = libro.css("a").attribute("href").value
        end 
    end 

    def self.scrape_book_details(book)
        html = open("https://www.goodreads.com#{book.url}").read
        # https://www.goodreads.com/book/show/4214.Life_of_Pi
        doc = Nokogiri::HTML(html)
        # doc.encoding = 'utf-8'
        book.author = doc.css("a.authorName")[0].text
            # binding.pry
        if !doc.css("#description span")[1]
            book.description = doc.css("#description span")[0].text
        else 
            book.description = doc.css("#description span")[1].text
        end    
        #  binding.pry
        book.rating = doc.at("//span[@itemprop = 'ratingValue']").text.strip
    end 


    # def self.scrape_book_details(book)
    #     html = open("https://www.goodreads.com#{book.url}")
    #     doc = Nokogiri::HTML(html)
    #     book.author = doc.css("a.authorName")[0].text
    #     book.description = doc.at("#description span").next_sibling.next_sibling.css("br")[1].next_sibling.text
    #     # doc.css("#description span")[1].children[-1].text
    #     # encoding_options = {
    #     #     :invalid           => :replace,  # Replace invalid byte sequences
    #     #     :undef             => :replace,  # Replace anything not defined in ASCII
    #     #     :replace           => '',        # Use a blank for those replacements
    #     #     :universal_newline => true       # Always break lines with \n
    #     #   }  
    #     #   x = doc.css("#description span")[1].children.text
    #     #   x.encode(Encoding.find('ASCII'), encoding_options) 
    #     # binding.pry
    #     book.rating = doc.at("//span[@itemprop = 'ratingValue']").text.strip
    #  # I used at("//span[@itemprop = 'addressLocality']"
    #  # Looks good: doc.css("#description span")[1].children.text.gsub!("â\u0080\u0099","'").gsub!("â\u0080\u0094","'")
    # # See String#encode documentation encoding_options = {   :invalid           => :replace,  # Replace invalid byte sequences   :undef             => :replace,  # Replace anything not defined in ASCII   :replace           => '',        # Use a blank for those replacements   :universal_newline => true       # Always break lines with \n } x.encode(Encoding.find('ASCII'), encoding_options) x = doc.css("#description span")[1].children.text
    # end 
end

 

