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
            print "(list/exit): "
            input = gets.strip.downcase
            case input
            when "list"
                list_techs
            else
                puts("¯\_(ツ)_/¯") unless input == 'exit'
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
    end
end
