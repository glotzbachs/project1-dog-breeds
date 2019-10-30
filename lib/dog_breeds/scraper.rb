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
        html=open("https://www.akc.org#{dog.breed_url}")#{breed_url}
        doc = Nokogiri::HTML(html)
        attributes=doc.css('ul.attribute-list li')
        attributes.each do |attribute|
            key=attribute.css('span')[0].text.downcase.split(":")[0].split(" ")[0]
            value=attribute.css('span')[1].text.strip
            binding.pry
            dog.send("#{key}=",value)
           
        end
        binding.pry
    end

end



#attribute= .css('span')[0].text
# attribute_info= .css('span')[1].text