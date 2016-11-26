require 'rails_helper'

RSpec.describe SchoolsController, type: :controller do
  let(:school) { School.create(name: 'Some Name', state: 'UT', group: 'k-12') }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'sets the school instance variable' do
      get :index
      expect(assigns(:schools)).to eq([])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: school.id
      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get :show, id: school.id
      expect(response).to render_template(:show)
    end

    it 'sets the school instance variable' do
      get :show, id: school.id
      expect(assigns(:school).name).to eq(school.name)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it 'renders new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'sets the new school instance variable' do
      get :new
      expect(assigns(:school)).to_not eq(nil)
      expect(assigns(:school).id).to eq(nil)
    end
  end

  describe 'POST #create' do
    before(:all) do
      @school_params = { school: {  name: 'Test', state: 'UT', group: 'college' }}
    end

    it 'sets the school instance variable' do
      post :create, @school_params
      expect(assigns(:school)).to_not eq(nil)
      expect(assigns(:school).name).to eq(@school_params[:school][:name])
    end

    it 'creates a new school' do
      expect(School.count).to eq(0)
      post :create, @school_params
      expect(School.count).to eq(1)
      expect(School.first.name).to eq(@school_params[:school][:name])
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, id: school.id
      expect(response).to have_http_status(:success)
    end

    it 'renders edit templates' do
      get :edit, id: school.id
      expect(response).to render_template(:edit)
    end

    it 'sets country instance variable' do
      get :edit, id: school.id
      expect(assigns(:school).id).to eq(school.id)
    end
  end

  describe 'Get #update' do
    it 'sets the school instance variable' do
      put :update, { id: school.id, school: {name: 'Test' }}
      expect(assigns(:school).id).to eq(school.id)
    end

    it 'updates the school' do
      put :update, { id: school.id, school: {name: 'Test' }}
      expect(school.reload.name).to eq('Test')
    end

    it 'sets a flash message on success' do
      put :update, { id: school.id, school: { name: 'Test' }}
      expect(flash[:success]).to eq('School Updated')
    end

    it 'redirects to show on success' do
      put :update, { id: school.id, school: {name: 'Test' }}
      expect(response).to redirect_to(school_path(school.id))
    end
  end

  describe 'Get #destroy' do
    it 'sets the school instance variable' do
      delete :destroy, id: school.id
      expect(assigns(:school)).to eq(school)
    end

    it 'destroys the school' do
      school
      expect(School.count).to eq(1)
      delete :destroy, id: school.id
      expect(School.count).to eq(0)
    end

    it 'sets the flash message' do
      delete :destroy, id: school.id
      expect(flash[:success]).to eq("School Deleted")
    end

    it 'redirect to index path after destroy' do
      delete :destroy, id: school.id
      expect(response).to redirect_to(schools_path)
    end
  end
end
