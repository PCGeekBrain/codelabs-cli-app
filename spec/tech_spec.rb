RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.describe "Tech" do
    context "#initialize" do
        let(:tech) {CodeLabs::Tech.new('Web')}
        it "creates a new object" do
            expect{CodeLabs::Tech.new('Android')}.to_not raise_error
            expect(tech.name).to eq('Web')
            expect(tech.labs).to match_array([])
        end
        it "has frozen labs array" do 
            expect(tech.labs).to match_array([])
            expect(tech.labs).to be_frozen
        end
    end
    context "#create" do
        it "create saves objects to master list" do
            @tech = CodeLabs::Tech.create('Android')
            expect(@tech).to be_a(CodeLabs::Tech)
            expect(CodeLabs::Tech.all).to match_array([@tech])
        end
    end
    context '#clear_all' do
        it "clears all array" do
            expect(CodeLabs::Tech.all.count).to eq(1)
            CodeLabs::Tech.clear_all
            expect(CodeLabs::Tech.all.count).to eq(0)
        end
    end
    context "#find_or_create" do
        let(:tech) {CodeLabs::Tech.find_or_create('Iot')}
        it "adds objects to array" do
            expect(tech).to be_a(CodeLabs::Tech)
            expect(CodeLabs::Tech.all).to include(tech)
        end
        it "finds objects that exist" do
            @tech = CodeLabs::Tech.find_or_create('Iot')
            expect(@tech).to be_a(CodeLabs::Tech)
            expect(@tech).to eq(tech)
            expect(CodeLabs::Tech.all).to include(@tech)
        end
    end

    context "#add_lab" do
        let(:tech) {CodeLabs::Tech.new('Web')}
        it "labs are frozen" do
            expect(tech.labs).to be_frozen
        end
        it "only takes lab objects" do
            expect{tech.add_lab("Test")}.to raise_error(TypeError)
            expect{tech.add_lab(CodeLabs::Lab.new)}.to_not raise_error(TypeError)
        end
    end

end