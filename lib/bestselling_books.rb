require 'pry'
require 'nokogiri'
require 'open-uri'
binding.pry
require_relative "./bestselling_books/version"
require_relative "./bestselling_books/scraper"
require_relative "./bestselling_books/cli"
require_relative "./bestselling_books/book"