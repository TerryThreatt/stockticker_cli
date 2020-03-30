
# "symbol"=>"PAYX", "name"=>"Paychex, Inc.", "price"=>60.17

class StocktickerCli::STOCK 
    attr_accessor :symbol, :name, :price  

    @@all = []
    def initialize(args) 
        args.each do |k, v|
            # checks if method exists for instance of stock
            self.send("#{k}=", v) if self.respond_to?(k)
        end 
        @@all << self
    end 


    def self.all 
        @@all 
    end
    
    def self.delete 
        @@all.clear 
    end 

end 