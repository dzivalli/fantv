require 'rails_helper'

RSpec.describe Search do
  describe '.result' do
    context 'when there is no result' do
      it 'returns hash with key total result eq 0' do
        hash = Search.new('qqqqqqqqqq').result
        expect(hash[:total_results]).to eq 0
      end
    end

    context 'when something was found' do
      before { @hash ||= Search.new('clint').result }

      it 'returns hash with total result eq 189' do
        expect(@hash[:total_results]).to eq 189
      end

      it 'returns hash that includes movies' do
        expect(@hash[:movies].length).to eq 7
      end

      it 'returns hash that includes shows' do
        expect(@hash[:shows].length).to eq 2
      end

      it 'returns hash that includes people' do
        expect(@hash[:people].length).to eq 11
      end
    end
  end
end