class CodeLabs::CLI
    def call
        puts "\n----------------------------------------------\n---------  Google CodeLabs Browsing CLI  -----\n----------------------------------------------"
        list_techs
        start
    end

    # The function that handles user input
    def start
        input = 'y'
        while input != 'exit' #untill the user types exit
            print "(tech/list/<number>/exit): "
            input = gets.strip.downcase
            pick_item(input.to_i - 1) if input.to_i > 0
            case input
            when "list"
                list_items
            when "tech"
                list_techs
            else
                puts("\n¯\_(ツ)_/¯ \nSorry, I do not know what that means") unless input == 'exit' || input.to_i > 0
                puts("(pst, try `1`)") if input.include?('number') || input.to_i > 0
            end
        end
    end

    # get all the techs from the scraper and list them
    def list_techs
        web = CodeLabs::Tech.find_or_create('Web')
        android = CodeLabs::Tech.find_or_create('Android')
        both  = CodeLabs::Lab.new
        web.add_lab(CodeLabs::Lab.new)
        web.add_lab(CodeLabs::Lab.new)
        web.add_lab(both)
        android.add_lab(CodeLabs::Lab.new)
        android.add_lab(both)
        # Techs.all => [<Tech> <Tech>]
        @items = CodeLabs::Tech.all #set the array to the items the user can input
        list_items
    end

    # this function will deal with picking an item
    def pick_item(index)
        item = @items[index]
        return puts("Can't seem to find that index :-(\n(pst, try 'list')") if item.nil? # check if the item is in the input list
        if item.is_a?(CodeLabs::Tech) # The go into that tech
            @items = item.labs
            list_items
        elsif item.is_a?(CodeLabs::Lab)
            print_lab(item)
        end
        #TODO handle different item types
    end

    # handles the proper formatting for the current list
    def list_items
        if @items[0].is_a?(CodeLabs::Tech)
            puts "\n------------------Pick A Tech-----------------"
            @items.each.with_index(1) {|tech, index| puts "#{index}. #{tech.name}" }
        elsif @items[0].is_a?(CodeLabs::Lab)
            puts "\n------------------Pick A Lab-----------------"
            @items.each.with_index(1) {|lab, index| puts "#{index}. #{lab.title}" }
        end
    end

    # handles the display of individual labs
    def print_lab(lab)
        puts ""
        puts "----------- #{lab.title} -----------"
        puts ""
        puts "URL:              #{lab.link}"
        puts "Time:             #{lab.duration}"
        puts "Author(s):        #{lab.author}"
        puts "Last updates:     #{lab.last_updated}"
        puts "Technology:       #{lab.print_techs}"
        puts ""
        puts ""
    end
end
