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
        puts "Would you like to view the top gainers in the stock market today?"
        sleep(1)
        puts ""
        puts "Type 'yes' to view gainers or type 'exit' to quit the cli app"
        puts ""

        input = gets.strip.downcase

        if input == 'exit'
            goodbye
        elsif input == 'yes' 
            # API call 
            puts ""
            stock_query = StocktickerCli::API.query
            info_query = StocktickerCli::API.info_query(StocktickerCli::STOCK.all.last)

            # Return 
            puts "Pick a stock from the list"
            puts ""
            puts "List:"
            StocktickerCli::STOCK.all.each.with_index(1) do |s, i|
                puts "#{i}. #{s.ticker} - #{s.companyName} - $#{s.price} - #{s.changesPercentage}" 
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
        
        input = gets.strip 
        
        if (input == 'yes')
            sleep(1)
            s = StocktickerCli::STOCK.all
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
