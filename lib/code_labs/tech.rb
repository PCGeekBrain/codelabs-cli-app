
class CodeLabs::Tech
    @@all = []
    attr_reader :name

    def initialize(name) # All tech has a name
        @name = name
        @labs = []
    end
    def save
        @@all << self
        self # return the object not the list
    end
    def labs
        @labs.dup.freeze
    end
    def add_lab(lab)
        # raise "Invalid Lab Type" unless lab.is_a?(Lab)
        @labs << lab
    end

    def self.all
        @@all
    end
    def self.clear_all
        @@all.clear
    end
    def self.create(name)
        self.new(name).save
    end
    def self.find_or_create(name)
        res = @@all.detect{|tech| tech.name == name}
        res ? res : self.create(name)
    end
end
