class DogBreeds::CLI
    
    def call
        greeting
        Scraper.breed_scrape
        user 
    end

    def greeting
        puts ""
        puts ""
        puts "Welcome to your Furry Friend Finder"
        puts "-----------------------------------"
        puts ""
        puts "Thinking about getting a new friend for the family?"
        puts "Check out these types of dogs to find out which one is right for you!"
        puts "Type 'list' to see the top rated dogs from AKC(American Kennel Club)."
        puts ""
    end

    def menu
        puts " "
        puts "-----------------------------------------------------------------------"
        puts "For more info about a particular breed, enter it's number for details!"
        puts "If you've decided on which furry friend is best for you,"
        puts "type 'exit', and get out there to find you're new friend"
        puts "To see the list of breeds again, type 'list'"
        puts "-----------------------------------------------------------------------"
        puts " "
    end

    def list_breeds
        puts ""
        Dog.all.each.with_index(1) do |dog,index|
            puts "#{index}. #{dog.breed}"
        end
        menu
    end

    def user
        input=nil
        while input!='exit'
        input=gets.strip
            case 
            when input.to_i > 0 && input.to_i < 193
                dog_info(input)
            when input.downcase == "list"
                list_breeds
            when input.downcase == "exit"
                done
            when input.downcase != ("list" && "exit")
                puts " "
                puts "Sorry, that was not a valid command. Try again."
                menu
            # when input.to_i > 0 || input.to_i < 193
            #     puts "Sorry, that number is not on our list."
            #     puts "Try again later, and maybe we'll have more info on the dog you're looking for!"
            end
        end     
    end

    def done
        puts " "
        puts "Thanks for choosing Furry Friend Finder! See you soon!"
        puts " "
    end

    def dog_info(input) 
        Dog.all.each.with_index(1) do |dog,index|
            if index==input.to_i
                Scraper.breed_info_scrape(dog) 
                puts " "
                puts " "
                puts "#{dog.breed}"
                x="-"
                puts x*(dog.breed.length)
                puts " "
                puts "Teperament: #{dog.temperament}"
                puts "AKC Breed Popularity: #{dog.akc}"
                puts "Height: #{dog.height}"
                puts "Weight: #{dog.weight}"
                puts "Life Expectancy: #{dog.life}"
                puts "Group: #{dog.group}"
                puts " "
            end
        end
        menu
    end

    #    def test
    #     Scraper.breed_info_scrape(Dog.all[0])
    #    end
end

