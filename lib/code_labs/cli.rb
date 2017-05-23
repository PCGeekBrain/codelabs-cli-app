class CodeLabs::CLI
    def call
        puts "-----------Google CodeLabs Browsing CLI-------"
        list_techs
        start
    end

    def start
        input = 'y'
        on_tech = false
        while input != 'exit'
            print "(techs/list/<number>/exit): "
            input = gets.strip.downcase

            if input.to_i > 0
                pick_item(input.to_i - 1)
            else
                case input
                when "list"
                    list_items
                when "techs"
                    list_techs
                else
                    puts("¯\_(ツ)_/¯ ") unless input == 'exit'
                    puts("(pst, try a number like 1)") if input.include?('number')
                end
            end
        end
    end

    def list_techs
        puts "\n------------------Pick A Tech-----------------"
        CodeLabs::Tech.find_or_create('Web')
        CodeLabs::Tech.find_or_create('Android')
        CodeLabs::Tech.find_or_create('iOS')
        # Techs.all => [<Tech> <Tech>]
        CodeLabs::Tech.all.each.with_index(1) { |tech, index| puts "#{index}. #{tech.name}" }
        @items = CodeLabs::Tech.all
    end

    def pick_item(index)
        item = @items[index]
        !item.nil? ? puts(item.name) : puts("¯\_(ツ)_/¯  Can't seem to find that index, try 'list'")
        #TODO handle different item types
    end
    def list_items
        if @items[0].is_a?(CodeLabs::Tech)
            @items.each.with_index(1) {|tech, index| puts "#{index}. #{tech.name}" }
        elsif @items[0].is_a?(CodeLabs::Lab)
            @items.each.with_index(1) {|lab, index| puts "#{index}. #{lab.title}" }
        end
    end
end
