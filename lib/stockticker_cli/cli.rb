
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

            # Return 
            puts "Pick a stock from the list"
            puts ""
            puts "Gainers List:"
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
        puts "Type a number between '1 - 10' on gainers list for more information on the stock."
        sleep(1)
        
        input = gets.strip.to_i
     
        if (input.between?(0, 10))
            s = StocktickerCli::STOCK.all[input - 1]
            StocktickerCli::API.info_query(s) 
            puts ""       
            puts "#{s.symbol} - #{s.companyName} - $#{s.price}"
            puts ""
            puts "Change: $ #{s.changes}"
            puts "Sector: #{s.sector}"
            puts "Industry: #{s.industry}"
            puts "Website: #{s.website}"
            puts ""
            puts "Description: #{s.description}"
            puts ""
            sleep(1.5)
            StocktickerCli::STOCK.reset 
            menu
        else
          puts "Please try again"
          submenu
        end
end  

    def goodbye
        puts "Happy Trading"
        sleep(1)
        puts "Goodbye!"
    end 
end 
