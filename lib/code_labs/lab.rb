
class CodeLabs::Lab
    # A single Lab on the page
    #
    # Example:
    #   CodeLabs::Lab.new
    #   or
    #   CodeLabs::Lab.new(args)
    # 
    # Arguments:
    #   title, duration, link, author, last_updated
    
    @@all = []
    attr_accessor :title, :duration, :link, :author, :last_updated

    def initialize(arguments={})
        # default values
        @duration = "N/A"
        @author = "N/A"
        @techs = []
        # Mass assignment
        arguments.each {|key, value| self.send("#{key}=", value) unless value == "" || value.nil?} # <- do not set the values if they are blank
        self.save # TODO: MOVE THIS LATER
    end
    def save
        @@all << self
    end
    
    def techs
        @techs.dup.freeze # <- freeze so we keep type integrity
    end
    def add_tech(tech) # <- enforce type and relationships
        raise TypeError unless tech.is_a?(CodeLabs::Tech)
        @techs << tech
        tech.add_lab(self) unless tech.labs.include?(self) # <- potenial infinte loop
    end
    def print_techs
        @techs.collect{|tech| tech.name}.join(', ') # <- Show all the related techs
    end

    def self.all
        @@all
    end
    def self.get_by_duration(minutes)
        self.all.select{|lab| lab.duration.split(" ")[0].to_i > minutes}
    end
end