require 'rails_helper'
RSpec.describe SchoolsController, type: :controller do
  let(:valid_attributes) {
    FactoryGirl.attributes_for :school
  }

  let(:invalid_attributes) {
    FactoryGirl.attributes_for :invalid_school
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all schools as @schools" do
      school = School.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:schools)).to eq([school])
    end
  end

  describe "GET #show" do
    it "assigns the requested school as @school" do
      school = School.create! valid_attributes
      get :show, params: {id: school.to_param}, session: valid_session
      expect(assigns(:school)).to eq(school)
    end
  end

  describe "GET #new" do
    it "assigns a new school as @school" do
      get :new, params: {}, session: valid_session
      expect(assigns(:school)).to be_a_new(School)
    end
  end

  describe "GET #edit" do
    it "assigns the requested school as @school" do
      school = School.create! valid_attributes
      get :edit, params: {id: school.to_param}, session: valid_session
      expect(assigns(:school)).to eq(school)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new School" do
        expect {
          post :create, params: {school: valid_attributes}, session: valid_session
        }.to change(School, :count).by(1)
      end

      it "assigns a newly created school as @school" do
        post :create, params: {school: valid_attributes}, session: valid_session
        expect(assigns(:school)).to be_a(School)
        expect(assigns(:school)).to be_persisted
      end

      it "redirects to the created school" do
        post :create, params: {school: valid_attributes}, session: valid_session
        expect(response).to redirect_to(School.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved school as @school" do
        post :create, params: {school: invalid_attributes}, session: valid_session
        expect(assigns(:school)).to be_a_new(School)
      end

      it "re-renders the 'new' template" do
        post :create, params: {school: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        FactoryGirl.attributes_for :school, name: 'New School of Techonology'
      }

      it "updates the requested school" do
        school = School.create! valid_attributes
        put :update, params: {id: school.to_param, school: new_attributes}, session: valid_session
        school.reload
        expect(school.name).to eq(new_attributes[:name])
      end

      it "assigns the requested school as @school" do
        school = School.create! valid_attributes
        put :update, params: {id: school.to_param, school: valid_attributes}, session: valid_session
        expect(assigns(:school)).to eq(school)
      end

      it "redirects to the school" do
        school = School.create! valid_attributes
        put :update, params: {id: school.to_param, school: valid_attributes}, session: valid_session
        expect(response).to redirect_to(school)
      end
    end

    context "with invalid params" do
      it "assigns the school as @school" do
        school = School.create! valid_attributes
        put :update, params: {id: school.to_param, school: invalid_attributes}, session: valid_session
        expect(assigns(:school)).to eq(school)
      end

      it "re-renders the 'edit' template" do
        school = School.create! valid_attributes
        put :update, params: {id: school.to_param, school: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested school" do
      school = School.create! valid_attributes
      expect {
        delete :destroy, params: {id: school.to_param}, session: valid_session
      }.to change(School, :count).by(-1)
    end

    it "redirects to the schools list" do
      school = School.create! valid_attributes
      delete :destroy, params: {id: school.to_param}, session: valid_session
      expect(response).to redirect_to(schools_url)
    end
  end

end
