# class Scraper 

#     def self.scraper 
# base = https://www.goodreads.com/ 
# iterate over = 
# link =  [base] + doc.css("table tr")[1].css("a").attribute("href").value
# book = doc.css("table tr")[1].css("a span").children[0].text
# author = doc.css("table tr")[1].css("a span").children[1].text
#     end
Method that scrapes and makes all book objects that know their own title and url
    open and nokogiri on https://www.goodreads.com/list/show/19.Best_for_Book_Clubs


Method #2 if someone want to see the details on a given book this method takes in the object that is a book that only knows title and url
    open and nokogiri on https://www.goodreads.com +  that book's url


# end 