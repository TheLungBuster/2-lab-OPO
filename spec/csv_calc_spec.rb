require 'rspec'
require_relative '../csv_calc'

RSpec.describe CSVcalc do
  describe '.csv calculate' do
    let(:csv) { CSVcalc.new('spec/exm.csv') }
    array = [12, 50, 72, 89, 33, 13, -1, 0, 124]
    context 'Search min' do
      it do
        expect(csv.min(array)).to eq(-1)
      end
    end

    context 'Search max' do
      it do
        expect(csv.max(array)).to eq 124
      end
    end

    context 'Calculate mean' do
      it do
        expect(csv.mean(array)).to eq 56.0
      end
    end

    context 'Calculate correct sample variance' do
      it do
        expect(csv.sample_variance(array)).to eq 2385.29
      end
    end
  end
end
