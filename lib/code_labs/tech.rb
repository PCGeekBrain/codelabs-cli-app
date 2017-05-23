# require 'pry'
class CodeLabs::Tech
    # A peice of tech covered in the lab
    #
    # Example:
    #   CodeLabs::Tech.new(name) <- does not add to .all
    #   CodeLabs::Tech.create(name) <- does add to .all
    #   CodeLabs::Tech.find_or_create(name) <- will return the tech if it exists or will return a new one
    # 
    # Arguments:
    #   title, duration, link, author, last_updated

    @@all = [] # <- The manager
    attr_reader :name # <- for display, saves 2 lines

    def initialize(name) # All tech has a name, no?
        @name = name
        @labs = []
    end
    def save
        @@all << self
        self # return the object not the list
    end
    def labs
        @labs.dup.freeze # <- no type editing here
    end
    def add_lab(lab) # <- type enforcment
        raise TypeError unless lab.is_a?(CodeLabs::Lab)
        @labs << lab
        lab.add_tech(self) unless lab.techs.include?(self) # <- infinite loop
    end

    def self.all
        @@all # <- the core of the cli listing is in here
    end
    def self.clear_all
        @@all.clear # <- I do not think I ended up needing this
    end
    def self.create(name)
        self.new(name).save # <- fancy
    end
    def self.find_or_create(name) # <- the meat of the creation
        res = @@all.detect{|tech| tech.name == name}
        res ? res : self.create(name)
    end
end
