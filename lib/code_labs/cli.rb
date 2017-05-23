class CodeLabs::CLI
    def call
        puts "Welcome to a Google CodeLabs browsing CLI"
        list_techs
        start
    end

    def start
        status = 'y'
        while status == 'y'
            status = 'n'
            # TODO: Get input and process it
        end
    end
    def list_techs
        puts "\nPlease select the tech you would like to see:"
        # Techs.all => [<Tech> <Tech>]
    end
end
