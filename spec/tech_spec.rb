RSpec.describe "Tech" do
    context "#initialize" do
        it "creates a new object" do
            @tech = CodeLabs::Tech.new('Web')
            expect{CodeLabs::Tech.new('Android')}.to_not raise_error
            expect(@tech.name).to eq('Web')
            expect(@tech.labs).to match_array([])
        end
    end
    context "#create" do
        it "create saves objects to master list" do
            @tech = CodeLabs::Tech.create('Web')
            expect(@tech).to be_a(CodeLabs::Tech)
            expect(CodeLabs::Tech.all).to match_array([@tech])
        end
    end
end