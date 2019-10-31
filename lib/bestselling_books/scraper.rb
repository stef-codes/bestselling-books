class Scraper 
# base = https://www.goodreads.com/ 
# iterate over = 
# link =  [base] + doc.css("table tr")[1].css("a").attribute("href").value
# book = doc.css("table tr")[1].css("a span").children[0].text
# author = doc.css("table tr")[1].css("a span").children[1].text
#     end

# Method that scrapes and makes all book objects that know their own title and url
#     open and nokogiri on https://www.goodreads.com/list/show/19.Best_for_Book_Clubs

    def self.scrape_book_list
        html = open("https://www.goodreads.com/list/show/19.Best_for_Book_Clubs")
        doc = Nokogiri::HTML(html)
        # base = "https://www.goodreads.com"
        # book = Book.new(name,url)
        doc.css("table tr").each do |book|  
            name = book.css("a span").children[0].text 
            url = book.css("a").attribute("href").value
            book = Book.new(name, url)
        end 
    end 
end
    # Method #2 if someone want to see the details on a given book this method takes in the object that is a book that only knows title and url
    #     open and nokogiri on https://www.goodreads.com +  that book's url
    #def scrape_book_details(book)

    



    #end
 

