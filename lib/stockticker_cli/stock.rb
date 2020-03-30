
# "symbol"=>"PAYX", "name"=>"Paychex, Inc.", "price"=>60.17

class StocktickerCli::STOCK 
    attr_accessor :symbol, :name, :price, :symbol, :price, :changes, :companyName, :industry, :website, :description, :sector  

    @@all = []
    def initialize(args) 
        set_attributes(args)
        @@all << self
    end 

    def set_attributes(hash) 
        hash.each do |k, v|
            # checks if method exists for instance of stock
            self.send("#{k}=", v) if self.respond_to?(k)
        end 
    end 

    def self.all 
        @@all 
    end

end 