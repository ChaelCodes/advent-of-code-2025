RSpec.describe Day01 do
  let(:solution) { described_class.new }
  let(:example_input) do
    %w[L68
    L30
    R48
    L5
    R60
    L55
    L1
    L99
    R14
    L82]
  end

  describe "#inputs" do
    subject { solution.inputs }

    context "with input file", :with_input_file do
      it { expect(subject.first).to eq "L32" }
      it { expect(subject.count).to eq 4392 }
    end
  end


  describe "#parse_records" do
    subject { solution.parse_records }

    before do
      solution.records = example_input
    end

    xit "parses records" do
      subject
      expect(solution.records).to eq []
    end
  end

  describe "#solve" do
    subject { solution.solve }

    context "for part 1" do
      context "with example input" do
        before do
          solution.records = example_input
        end

        it { is_expected.to eq 3 }
      end

      context "with input file", :with_input_file do
        it { is_expected.to eq 1092 }
      end
    end

    context "for part 2" do
      let(:solution) { described_class.new(part: 2) }

      context "with example input" do
        before do
          solution.records = example_input
        end

        it { is_expected.to eq 6 }
      end

      context "with input file", :with_input_file do
        it { is_expected.to eq 6616 }
      end
    end
  end
end