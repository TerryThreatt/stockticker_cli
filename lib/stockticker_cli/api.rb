class StocktickerCli::API
    BASE_URL = 'https://fmpcloud.io/api/v3/'
    KEY = ENV["API_KEY"]


    
    # Api call 
    def self.query
        # https://fmpcloud.io/api/v3/actives?apikey=4b31fc84cd3248a0f61868b96f531bde
        results = RestClient.get("#{BASE_URL}actives?apikey=#{KEY}") 
        json = JSON.parse(results) 
        # binding.pry 

        # iterating through results and creating stock instances
        json.each do |stock_hash|
           StocktickerCli::STOCK.new(stock_hash) 
        end  
    end 

    def self.info_query(stock_obj)
        results = RestClient.get("#{BASE_URL}profile/#{stock_obj.ticker}?apikey=#{KEY}")
        json = JSON.parse(results)
        stock_obj.set_attributes(json[0])
    end 
end 