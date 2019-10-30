class DogBreeds::CLI
    
    def call
        greeting
        Scraper.breed_scrape
        # binding.pry
        
        list_breeds
        menu
          
        # test  
    end

    def greeting
        puts "Welcome to your Furry Friend Finder"
        puts "-----------------------------------"
        puts "Thinking about getting a new friend for the family?"
        puts "Check out these types of dogs to find out which one is right for you!"
    end

    def list_breeds
        # binding.pry
        Dog.all.each.with_index(1) do |dog,index|
            puts "#{index}. #{dog.breed}"
        end
    end

    def menu
        input=nil
        while input!='exit'
        puts "To learn more about each breed, enter it's number to learn more!"
        puts "If you've decided on which furry friend is best for you,"
        puts "type 'exit', and get out there to find you're new friend"
        puts "To see the list of breeds again, type 'list'"
            input=gets.strip.downcase
            case input
            when "1"
                puts "More on 1"
            when "2"
                puts "More on 2"
            when "3"
                puts "More on 3"
            when "4"
                puts "More on 4"
            when "list"
                list_breeds
            when "exit"
                done
            else 
                puts "Sorry, that number is not on our list."
                puts "Try again later, and maybe we'll have more info on the dog you're looking for!"
            end
        end     
    end

    def done
       puts "Thanks for choosing Furry Friend Finder! See you soon!"
    end

       def test
        Scraper.new.breed_scrape
       end
end

