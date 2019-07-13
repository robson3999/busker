# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SongsController, type: :controller do
  let(:song_attributes) { attributes_for(:song) }
  let(:song_invalid_attributes) { { title: '', text: '' } }

  context 'when guest' do
    describe 'GET #index' do
      it 'returns a success response' do
        get :index
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #show' do
      it 'returns a success response' do
        song = create(:song)
        get :show, params: { id: song.id }

        expect(response).to have_http_status(:success)
      end
    end
  end

  context 'when logged in user' do
    user = login_user

    describe 'GET #new' do
      it 'returns a success response' do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    describe 'GET #edit' do
      it 'returns a success response' do
        song = create(:song)
        get :edit, params: { id: song.id }
        expect(response).to have_http_status(:success)
      end
    end

    describe 'POST #create' do
      context 'with valid params' do
        subject do
          post :create, params: { song: song_attributes.merge(user_id: user.id) }
        end
        it 'creates a new song' do
          expect do
            subject
          end.to change(Song, :count).by(1)
        end

        it 'redirects to the created song' do
          subject
          expect(response).to redirect_to(Song.last)
        end

        it 'should assign success message' do
          subject
          expect(flash[:notice]).to eq(I18n.t('songs.actions.create.success'))
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'new' template)" do
          post :create, params: { song: song_invalid_attributes }
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe 'PUT #update' do
      context 'with valid params' do
        let!(:song) { create(:song) }
        let(:new_attributes) { { title: 'Abc new title' } }

        subject do
          put :update, params: { id: song.id, song: new_attributes }
        end

        it 'updates the requested song' do
          subject
          song.reload
          expect(song.title).to eq('Abc new title')
        end

        it 'redirects to the song' do
          subject
          expect(response).to redirect_to(song)
        end

        it 'should assign success message' do
          subject
          expect(flash[:notice]).to eq(I18n.t('songs.actions.update.success'))
        end
      end

      context 'with invalid params' do
        it "returns a success response (i.e. to display the 'edit' template)" do
          song = create(:song)
          put :update, params: { id: song.to_param, song: song_invalid_attributes }
          expect(response).to have_http_status(:success)
        end
      end
    end

    describe 'DELETE #destroy' do
      let!(:song) { create(:song) }

      subject do
        delete :destroy, params: { id: song.id }
      end

      it 'destroys the requested song' do
        expect do
          subject
        end.to change(Song, :count).by(-1)
      end

      it 'redirects to the songs list' do
        subject
        expect(response).to redirect_to(songs_url)
      end

      it 'should assign success message' do
        subject
        expect(flash[:notice]).to eq(I18n.t('songs.actions.destroy.success'))
      end
    end
  end
end
