RSpec.describe Day03 do
  let(:solution) { described_class.new }
  let(:example_input) do
    %w[987654321111111
      811111111111119
      234234234234278
      818181911112111]
  end

  describe "#inputs" do
    subject { solution.inputs }

    context "with input file", :with_input_file do
      xit { expect(subject.first).to eq "" }
      it { expect(subject.count).to eq 200 }
    end
  end


  describe "#parse_records" do
    subject { solution.parse_records }

    before do
      solution.records = example_input
    end

    it "parses records" do
      subject
      expect(solution.records).to eq [["9","8","7","6","5","4","3","2","1","1","1","1","1","1","1"],
      ["8","1","1","1","1","1","1","1","1","1","1","1","1","1","9"],
      ["2","3","4","2","3","4","2","3","4","2","3","4","2","7","8"],
      ["8","1","8","1","8","1","9","1","1","1","1","2","1","1","1"]]
    end
  end

  describe "#max_joltage" do
    subject { solution.max_joltage(battery_bank) }
    
    it "computes the max joltage", :aggregate_failures do
      expect(solution.max_joltage(%w[9 8 7 6 5 4 3 2 1 1 1 1 1 1 1], 2)).to eq "98"
      expect(solution.max_joltage(%w[8 1 1 1 1 1 1 1 1 1 1 1 1 1 9], 2)).to eq "89"
      expect(solution.max_joltage(%w[2 3 4 2 3 4 2 3 4 2 3 4 2 7 8], 2)).to eq "78"
      expect(solution.max_joltage(%w[8 1 8 1 8 1 9 1 1 1 1 2 1 1 1], 2)).to eq "92"
    end

    context "for part two" do
      let(:solution) { described_class.new(part: 2) }

      it "computes the max joltage", :aggregate_failures do
        expect(solution.max_joltage(%w[9 8 7 6 5 4 3 2 1 1 1 1 1 1 1], 12)).to eq "987654321111"
        expect(solution.max_joltage(%w[8 1 1 1 1 1 1 1 1 1 1 1 1 1 9], 12)).to eq "811111111119"
        expect(solution.max_joltage(%w[2 3 4 2 3 4 2 3 4 2 3 4 2 7 8], 12)).to eq "434234234278"
        expect(solution.max_joltage(%w[8 1 8 1 8 1 9 1 1 1 1 2 1 1 1], 12)).to eq "888911112111"
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

        it { is_expected.to eq 357 }
      end

      context "with input file", :with_input_file do
        it { is_expected.to eq 17087 }
      end
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      context "with example input" do
        before do
          solution.records = example_input
        end

        it { is_expected.to eq 3121910778619 }
      end

      context "with input file", :with_input_file do
        it { is_expected.to eq 169019504359949 }
      end
    end
  end
end