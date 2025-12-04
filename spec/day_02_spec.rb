RSpec.describe Day02 do
  let(:solution) { described_class.new }
  let(:example_input) do
    "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"
  end

  describe "#inputs" do
    subject { solution.inputs }

    xcontext "with input file", :with_input_file do
      xit { expect(subject.first).to eq "" }
      it { expect(subject.count).to eq 0 }
    end
  end


  describe "#parse_records" do
    subject { solution.parse_records }

    before do
      solution.records = example_input
    end

    it "parses records" do
      subject
      expect(solution.records).to eq [[11,22],[95,115],[998,1012],[1188511880,1188511890],
                                      [222220,222224],[1698522,1698528],[446443,446449],
                                      [38593856,38593862],[565653,565659],
                                      [824824821,824824827],[2121212118,2121212124]]
    end
  end

  describe "#invalid_id_count" do
    it "counts invalid IDs in range", :aggregate_examples do
      expect(solution.invalid_ids((11..22).to_a)).to eq [11, 22]
      expect(solution.invalid_ids((95..115).to_a)).to eq [99]
      expect(solution.invalid_ids((998..1012).to_a)).to eq [1010]
      expect(solution.invalid_ids((1188511880..1188511890).to_a)).to eq [1188511885]
      expect(solution.invalid_ids((222220..222224).to_a)).to eq [222222]
      expect(solution.invalid_ids((1698522..1698528).to_a)).to eq []
      expect(solution.invalid_ids((446443..446449).to_a)).to eq [446446]
      expect(solution.invalid_ids((38593856..38593862).to_a)).to eq [38593859]
      expect(solution.invalid_ids((565653..565659).to_a)).to eq []
      expect(solution.invalid_ids((824824821..824824827).to_a)).to eq []
      expect(solution.invalid_ids((2121212118..2121212124).to_a)).to eq []
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      it "counts invalid IDs in range", :aggregate_examples do
        expect(solution.invalid_ids((11..22).to_a)).to eq [11, 22]
        expect(solution.invalid_ids((95..115).to_a)).to eq [99, 111]
        expect(solution.invalid_ids((998..1012).to_a)).to eq [999, 1010]
        expect(solution.invalid_ids((1188511880..1188511890).to_a)).to eq [1188511885]
        expect(solution.invalid_ids((222220..222224).to_a)).to eq [222222]
        expect(solution.invalid_ids((1698522..1698528).to_a)).to eq []
        expect(solution.invalid_ids((446443..446449).to_a)).to eq [446446]
        expect(solution.invalid_ids((38593856..38593862).to_a)).to eq [38593859]
        expect(solution.invalid_ids((565653..565659).to_a)).to eq [565656]
        expect(solution.invalid_ids((824824821..824824827).to_a)).to eq [824824824]
        expect(solution.invalid_ids((2121212118..2121212124).to_a)).to eq [2121212121]
      end
    end
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      context "with example input" do
        before do
          solution.records = example_input
        end

        it { is_expected.to eq 1227775554 }
      end

      context "with input file", :with_input_file do
        it { is_expected.to eq 21139440284 }
      end
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      context "with example input" do
        before do
          solution.records = example_input
        end

        it { is_expected.to eq 4174379265 }
      end

      context "with input file", :with_input_file do
        it { is_expected.to eq 38731915928 }
      end
    end
  end
end