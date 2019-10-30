class Dog

    attr_accessor :breed, :breed_url, :temperament, :akc, :height, :weight, :life, :group
    @@all=[]

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

end