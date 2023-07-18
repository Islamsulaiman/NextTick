# spec/controllers/categories_controller_spec.rb
require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe 'GET #index' do
    it 'assigns all categories to @categories' do
      category1 = create(:category)
      category2 = create(:category)
      get :index
      expect(assigns(:categories)).to match_array([category1, category2])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested category to @category' do
      category = create(:category)
      get :show, params: { id: category.id }
      expect(assigns(:category)).to eq(category)
    end

    it 'renders the show template' do
      category = create(:category)
      get :show, params: { id: category.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns a new category to @category' do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested category to @category' do
      category = create(:category)
      get :edit, params: { id: category.id }
      expect(assigns(:category)).to eq(category)
    end

    it 'renders the edit template' do
      category = create(:category)
      get :edit, params: { id: category.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new category' do
        expect {
          post :create, params: { category: attributes_for(:category) }
        }.to change(Category, :count).by(1)
      end

      it 'redirects to the new category' do
        post :create, params: { category: attributes_for(:category) }
        expect(response).to redirect_to(Category.last)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new category' do
        expect {
          post :create, params: { category: attributes_for(:category, name: nil) }
        }.not_to change(Category, :count)
      end

      it 're-renders the new template' do
        post :create, params: { category: attributes_for(:category, name: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH #update' do
    let(:category) { create(:category) }

    context 'with valid attributes' do
      it 'updates the requested category' do
        patch :update, params: { id: category.id, category: { name: 'New Name' } }
        category.reload
        expect(category.name).to eq('New Name')
      end

      it 'redirects to the updated category' do
        patch :update, params: { id: category.id, category: { name: 'New Name' } }
        expect(response).to redirect_to(category)
      end
    end

    context 'with invalid attributes' do
      it 'does not update the requested category' do
        patch :update, params: { id: category.id, category: { name: nil } }
        category.reload
        expect(category.name).not_to be_nil
      end

      it 're-renders the edit template' do
        patch :update, params: { id: category.id, category: { name: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:category) { create(:category) }

    context 'with associated projects' do
      it 'does not delete the category' do
        create(:project, category: category)
        expect {
          delete :destroy, params: { id: category.id }
        }.not_to change(Category, :count)
      end

      it 'redirects to the categories index page with an error message' do
        create(:project, category: category)
        delete :destroy, params: { id: category.id }
        expect(response).to redirect_to(categories_path)
        expect(flash[:alert]).to eq('Cannot delete category with associated projects.')
      end
    end

    context 'without associated projects' do
      it 'deletes the category' do
        expect {
          delete :destroy, params: { id: category.id }
        }.to change(Category, :count).by(-1)
      end

      it 'redirects to the categories index page with a success message' do
        delete :destroy, params: { id: category.id }
        expect(response).to redirect_to(categories_path)
        expect(flash[:notice]).to eq('Category was successfully destroyed.')
      end
    end
  end
end