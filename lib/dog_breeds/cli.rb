class DogBreeds::CLI
    
    def call
        greeting
        Scraper.breed_scrape
        # binding.pry
        
        list_breeds
        menu
          
        test  
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
        puts "For more info about a particular breed, enter it's number for details!"
        puts "If you've decided on which furry friend is best for you,"
        puts "type 'exit', and get out there to find you're new friend"
        puts "To see the list of breeds again, type 'list'"
        input=gets.strip
            case 
            when input.to_i > 0 && input.to_i < 193
                puts "Info on that dog"
            when input.downcase == "list"
                list_breeds
            when input.downcase == "exit"
                done
            when input.downcase != ("list" && "exit")
                puts "Sorry, that was not a valid command. Try again."
            # when input.to_i > 0 || input.to_i < 193
            #     puts "Sorry, that number is not on our list."
            #     puts "Try again later, and maybe we'll have more info on the dog you're looking for!"
            end
        end     
    end

    def done
       puts "Thanks for choosing Furry Friend Finder! See you soon!"
    end

       def test
        Scraper.breed_info_scrape(Dog.all[0])
       end
end

