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
        expect(response.body).to be_json_eql(%({"total_results":0})).excluding('movies', 'shows', 'people')
      end
    end

    context 'when something found 'do
      before { post :search, text: 'clint', format: :json }

      it 'returns status 200' do
        expect(response).to be_success
      end

      it 'includes total results equal 189' do
        expect(response.body).to be_json_eql(%({"total_results":189})).excluding('movies', 'shows', 'people')
      end

      it 'includes movies' do
        expect(response.body).to have_json_size(7).at_path('movies')
      end

      it 'includes shows' do
        expect(response.body).to have_json_size(2).at_path('shows')
      end

      it 'includes people' do
        expect(response.body).to have_json_size(11).at_path('people')
      end
    end
  end
end