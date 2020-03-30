require_relative './api'

class StocktickerCli::CLI  
    
    def call
        welcome 
    end

    def welcome 
        puts "Welcome to the stock ticker cli app!"
        puts ""
        sleep(1)
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
            puts ""
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
        sleep(1)
        puts ""
        puts "Type 'yes' for more info or 'exit' to exit"
        
        input = gets.strip.downcase 
        
        if (input == 'yes')

            # StocktickerCli::STOCKINFO.all.each do |s|
            sleep(1)
            puts ""
            s = StocktickerCli::STOCK.all.last 
                puts ""        
                puts "#{s.symbol} - #{s.companyName} - $#{s.price}"
                puts ""
                puts "Change: $#{s.changes}"
                puts "Sector: #{s.sector}"
                puts "Industry: #{s.industry}"
                puts "Website: #{s.website}"
                puts ""
                puts "Description: #{s.description}"
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
        sleep(1)
        puts "Goodbye!"
    end 
end 
