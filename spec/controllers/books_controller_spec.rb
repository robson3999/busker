# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:book_attributes) { attributes_for(:book) }
  let(:book_invalid_attributes) { { title: '', description: '' } }

  context 'when guest' do
    describe 'GET #index' do
      it 'returns redirect response' do
        get :index
        expect(response).to have_http_status(:redirect)
      end

      it 'redirects to root path' do
        get :index
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'GET #show' do
      it 'returns redirect response' do
        book = create(:book)
        get :show, params: { id: book.id }

        expect(response).to have_http_status(:redirect)
      end
      
      it 'redirects to root path' do
        book = create(:book)
        get :show, params: { id: book.id }

        expect(response).to redirect_to(root_path)
      end
    end
  end

  context 'when logged in user' do
    login_user

    describe 'GET #show' do
      it 'returns a success response' do
        book = create(:book)
        get :show, params: { id: book.id }

        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #new' do
      it 'returns a success response' do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #edit' do
      it 'returns a success response' do
        book = create(:book)
        get :edit, params: { id: book.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        subject do
          post :create, params: { book: book_attributes }
        end
        it 'creates a new Book' do
          expect do
            subject
          end.to change(Book, :count).by(1)
        end

        it 'redirects to the created book' do
          subject
          expect(response).to redirect_to(Book.last)
        end

        it 'should assign success message' do
          subject
          expect(flash[:notice]).to eq(I18n.t('books.actions.create.success'))
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: { book: book_invalid_attributes }
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let!(:book) { create(:book) }
        let(:new_attributes) { { title: 'Abc new title' } }

        subject do
          put :update, params: { id: book.id, book: new_attributes }
        end

        it 'updates the requested book' do
          subject
          book.reload
          expect(book.title).to eq('Abc new title')
        end

        it 'redirects to the book' do
          subject
          expect(response).to redirect_to(book)
        end

        it 'should assign success message' do
          subject
          expect(flash[:notice]).to eq(I18n.t('books.actions.update.success'))
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'edit' template)" do
          book = create(:book)
          put :update, params: { id: book.to_param, book: book_invalid_attributes }
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe 'DELETE #destroy' do
      let!(:book) { create(:book) }

      subject do
        delete :destroy, params: { id: book.id }
      end

      it 'destroys the requested book' do
        expect do
          subject
        end.to change(Book, :count).by(-1)
      end

      it 'redirects to the books list' do
        subject
        expect(response).to redirect_to(books_url)
      end

      it 'should assign success message' do
        subject
        expect(flash[:notice]).to eq(I18n.t('books.actions.destroy.success'))
      end
    end
  end
end
