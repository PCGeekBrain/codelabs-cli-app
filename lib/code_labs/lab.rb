# require 'pry'
class CodeLabs::Lab
    attr_accessor :title, :duration, :link, :author, :last_updated

    def initialize(arguments={})
        # default values
        @duration = "N/A"
        @author = "N/A"
        @techs = []
        # Mass assignment
        arguments.each {|key, value| self.send("#{key}=", value)}
    end

    def techs
        @techs.dup.freeze
    end
    
    def add_tech(tech)
        raise TypeError unless tech.is_a?(CodeLabs::Tech)
        @techs << tech
        tech.add_lab(self) unless tech.labs.include?(self)
    end
end