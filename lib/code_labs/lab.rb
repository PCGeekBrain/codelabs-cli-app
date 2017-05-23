
class CodeLabs::Lab
    attr_accessor :title, :duration, :link, :author, :last_updated

    def initialize(arguments={})
        # default values
        @duration = "N/A"
        @author = "N/A"
        # Mass assignment
        arguments.each {|key, value| self.send("#{key}=", value)}
    end
end