require_relative './api'

class StocktickerCli::CLI  
    
    def call
        welcome 
        menu
    end

    def welcome 
        puts "Welcome to the stock ticker cli app"
    end 
    
    def menu
        puts "Which stock would you like to get a quote for?"

        input = gets.strip.upcase 

        StocktickerCli::API.query(input)
    end 
end