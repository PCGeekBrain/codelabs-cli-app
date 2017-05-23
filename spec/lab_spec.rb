RSpec::Expectations.configuration.on_potential_false_positives = :nothing

RSpec.describe "Tech" do
    context "#initialize" do
        let(:lab1) {CodeLabs::Lab.new({title: 'Title', duration:"15 min", link: "google.com", author: "bob", last_updated: "May 22, 2017"})}
        it "creates a valid object" do
            expect{CodeLabs::Lab.new}.to_not raise_error
            expect(lab1.title).to eq('Title')
            expect(lab1.duration).to eq("15 min")
            expect(lab1.link).to eq("google.com")
            expect(lab1.author).to eq("bob")
            expect(lab1.last_updated).to eq("May 22, 2017")
        end
        it "supplies default values for some fields" do
            @lab = CodeLabs::Lab.new
            expect(lab1.duration).to eq('N/A')
            expect(lab1.author).to eq('N/A')
            expect(lab1.last_updated).to eq('N/A')
        end
    end
end
