class StocktickerCli::API
    BASE_URL = 'https://fmpcloud.io/api/v3/'
    KEY = ENV["API_KEY"]


    
    # Api call 
    def self.query(query) 
        results = RestClient.get("#{BASE_URL}quote/#{query}?apikey=#{KEY}") 
        json = JSON.parse(results) 
        # binding.pry 

        # iterating through results and creating stock instances
        json.each do |stock_hash|
           StocktickerCli::STOCK.new(stock_hash) 
        end  
    end 

    def self.info_query(stock_obj)
        results = RestClient.get("#{BASE_URL}profile/#{stock_obj.symbol}?apikey=#{KEY}")
        json = JSON.parse(results)
        stock_obj.set_attributes(json[0])
    end 
end 