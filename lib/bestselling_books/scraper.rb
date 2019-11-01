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
        #  puts "*******Scraping Book Details******"
        html = open("https://www.goodreads.com#{book.url}")
        doc = Nokogiri::HTML(html)
        book.author = doc.css("a.authorName")[0].text
        book.description = doc.css("#description span")[1].children[-1].text
        # binding.pry
        book.rating = doc.at("//span[@itemprop = 'ratingValue']").text.strip
     # I used at("//span[@itemprop = 'addressLocality']"
    end 
end

 

