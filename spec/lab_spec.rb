RSpec::Expectations.configuration.on_potential_false_positives = :nothing
RSpec.describe "Lab" do
    let(:lab1) {CodeLabs::Lab.new({title: 'Title', duration:"15 min", link: "google.com", author: "bob", last_updated: "May 22, 2017"})}
    context "#initialize" do
        it "creates a valid object" do
            expect{CodeLabs::Lab.new}.to_not raise_error
            expect(lab1.title).to eq('Title')
            expect(lab1.duration).to eq("15 min")
            expect(lab1.link).to eq("google.com")
            expect(lab1.author).to eq("bob")
            expect(lab1.last_updated).to eq("May 22, 2017")
        end
        it "supplies default values for duration and author" do
            @lab = CodeLabs::Lab.new
            expect(@lab.duration).to eq('N/A')
            expect(@lab.author).to eq('N/A')
        end
    end
    context '#techs' do
        let(:tech) {CodeLabs::Tech.new('Web')}
        let(:lab) {CodeLabs::Lab.new}
        it "is frozen" do
            expect(lab1.techs).to be_frozen
            expect{lab1.techs = []}.to raise_error
        end
        describe "#add_tech"
        it 'enforces type' do
            expect{lab.add_tech("test")}.to raise_error(TypeError)
        end
        it 'creates a two way relationship' do
            lab.add_tech(tech)
            expect(lab.techs).to match_array([tech])
            expect(tech.labs).to include(lab)
        end
    end
end
