class StocktickerCli::API
    BASE_URL = 'https://fmpcloud.io/api/v3/'
    API_KEY = '4b31fc84cd3248a0f61868b96f531bde'

    
    # Api call 
    def self.query(query) 
        results = RestClient.get("#{BASE_URL}quote/#{query}?apikey=#{API_KEY}") 
        json = JSON.parse(results) 
        # binding.pry 

        # iterating through results and creating stock instances
        json.each do |stock_hash|
           StocktickerCli::STOCK.new(stock_hash) 
        end 
        # binding.pry 
    end 

    def self.info_query(query) 
        results = RestClient.get("#{BASE_URL}profile/#{query}?apikey=#{API_KEY}")
        json = JSON.parse(results)

        # iterating through results and creating stock info instances
        json.each do |stock_info_hash|
            StocktickerCli::STOCKINFO.new(stock_info_hash) 
        end 
        # binding.pry 
    end 
end 