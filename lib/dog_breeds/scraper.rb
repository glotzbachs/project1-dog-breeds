class Scraper

    def self.breed_scrape
        html=open("https://www.akc.org/most-popular-breeds/2018-full-list/")
        doc = Nokogiri::HTML(html)
        dogs= doc.css('tbody tr').drop(1)
            dogs.each do |breed|
                dog=Dog.new
                dog.breed= breed.css('a').text.strip
                dog.breed_url= breed.css('a').attribute("href").value   
            end
            # binding.pry
    end

    def self.breed_info_scrape(dog)

    end

end


