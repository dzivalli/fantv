require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    it 'renders template index' do
      get :index

      expect(response).to render_template :index
    end
  end

  describe 'POST #search' do
    context 'when nothing found' do
      before { post :search, text: 'qqqqqqqqqqqq', format: :json }

      it 'returns status 200' do
        expect(response).to be_success
      end

      it 'includes total results equal 0' do
        expect(response.body).to be_json_eql(%({"total_results":0}))
      end
    end

    context 'when something found 'do
    end
  end
end