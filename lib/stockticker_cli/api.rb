class StocktickerCli::API
    BASE_URL = 'https://fmpcloud.io/api/v3/'
    API_KEY = '4b31fc84cd3248a0f61868b96f531bde'

    # Query - https://fmpcloud.io/api/v3/quote/AAPL?apikey=4b31fc84cd3248a0f61868b96f531bde

    def self.query(query) 
        results = RestClient.get("#{BASE_URL}quote/#{query}?apikey=#{API_KEY}")
        json = JSON.parse(results)
        # binding.pry 
        puts json 

    end 

end 