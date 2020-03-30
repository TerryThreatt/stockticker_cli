require_relative './api'

class StocktickerCli::CLI  
    
    def call
        welcome 
    end

    def welcome 
        puts "Welcome to the stock ticker cli app!"
        puts ""
        menu 
    end 
    
    def menu
        puts "Type in a valid ticker symbol to get a quote or type 'exit' to quit the cli app"
        puts ""

        input = gets.strip.upcase 

        if input == 'EXIT'
            goodbye
        elsif input != 'EXIT' 
            # API call 
            stock_query = StocktickerCli::API.query(input) 
            info_query = StocktickerCli::API.info_query(StocktickerCli::STOCK.all.last)

            # Return 
            StocktickerCli::STOCK.all.each do |s|
                puts "#{s.symbol} - #{s.name} - $#{s.price}" 
            end 

            puts ""
            submenu
        else 
            puts "Try again"
            puts ""
            menu
        end 
    end 

    def submenu 
        puts "Would you like to get more information about this stock"
        puts "Type 'yes' for more info or 'exit' to exit"
        
        input = gets.strip.downcase 
        
        if (input == 'yes')

            # StocktickerCli::STOCKINFO.all.each do |s|
            s = StocktickerCli::STOCK.all.last 
                puts ""        
                puts "#{s.symbol} - #{s.companyName} - $#{s.price}"
                puts "change: #{s.changes}"
                puts "sector: #{s.sector}"
                puts "industry: #{s.industry}"
                puts "website: #{s.website}"
                puts "description: #{s.description}"
                puts ""
                menu
            # end 
        elsif (input == 'exit')
            goodbye
        else 
            puts "Try again"
            puts ""
            submenu
        end     
    end 

    def goodbye
        puts "Happy Trading"
        puts "Goodbye!"
    end 
end 
