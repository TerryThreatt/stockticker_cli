require_relative './api'

class StocktickerCli::CLI  
    
    def call
        welcome 
        menu
        submenu
    end

    def welcome 
        puts "Welcome to the stock ticker cli app"
    end 
    
    def menu
        puts "Type in a ticker symbol to get a quote?"

        input = gets.strip.upcase 

        StocktickerCli::API.query(input)
        StocktickerCli::API.info_query(input)

        StocktickerCli::STOCK.all.each do |s|
            puts "#{s.symbol} - #{s.name}  $#{s.price}" 
        end 
    end 

    def submenu 
        puts "Which stock would you like to get a quote for?"
        puts "Type 'y' for more info or 'n' to exit"
        
        input = gets.strip.downcase 
        if (input == 'y')
            StocktickerCli::STOCKINFO.all.each do |s|
                p "#{s.symbol} - #{s.companyName} $#{s.price} change: #{s.changes}  industry: #{s.industry} sector: #{s.sector} website: #{s.website} description: #{s.description}"
            end 
        elsif (input == 'n')
            goodbye
        else 
            puts "Try again"
            submenu 
        end 
    end 

    def goodbye
        puts "Happy Trading - Goodbye"
    end 
end 
