# spec/controllers/comics_controller_spec.rb

RSpec.describe ComicsController, type: :controller do
  describe 'POST #search' do
    let(:user) { User.create(username: 'testuser', email: 'test@example.com', password: 'password') }
    let(:query) { 'Batman' }

    it 'renders the index template with search results' do
      post :search, params: { id: user.id, query: query }
      expect(response).to render_template('comics/index')
      expect(assigns(:comics)).not_to be_empty
    end

    it 'redirects to discover page if query is blank' do
      post :search, params: { id: user.id, query: '' }
      expect(response).to redirect_to(user_discover_comics_path(id: user.id))
      expect(flash[:alert]).to eq('Error: You must provide a query')
    end
  end
end
