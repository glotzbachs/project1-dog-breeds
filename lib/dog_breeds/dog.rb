class Dog

    attr_accessor :breed, :breed_url
    @@all=[]

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

end