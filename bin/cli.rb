class Scraper

    def breed_scrape
        html=open("https://www.akc.org/most-popular-breeds/2018-full-list/")
        doc = Nokogiri::HTML(html)
        binding.pry
        dogs= doc.css("div.content-body")
        dogs.each |dog|
            breed dog.css('span.font-weight').text
            url dog.css("a").attribute("href").value

    end

end