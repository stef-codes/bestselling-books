class Scraper 
    
# base website = https://www.goodreads.com/ iterate over


# Method #1 that scrapes and makes all book objects that know their own title and url
#     open and nokogiri on https://www.goodreads.com/list/show/19.Best_for_Book_Clubs
    def self.scrape_book_list
        html = open("https://www.goodreads.com/list/show/19.Best_for_Book_Clubs")
        doc = Nokogiri::HTML(html)
        doc.css("table tr").each do |libro|  
            book = Book.new
            book.name = libro.css("a span").children[0].text 
            book.url = libro.css("a").attribute("href").value
        end 
    end 

# #Method #2 someone want to see the details on a given book this method takes in the object that is a book that only knows title and url
#        open and nokogiri on https://www.goodreads.com +  that book's url
    def self.scrape_book_details(book)
        html = open("https://www.goodreads.com#{book.url}").read
        doc = Nokogiri::HTML(html)
        book.author = doc.css("a.authorName")[0].text
        if !doc.css("#description span")[1]
            book.description = doc.css("#description span")[0].text
        else 
            book.description = doc.css("#description span")[1].text
        end    
        book.rating = doc.at("//span[@itemprop = 'ratingValue']").text.strip
    end 
end

 

