require 'rails_helper'

describe 'Posts', '#GET /index' do
  subject(:req_index) { get '/posts' }
  context 'when the user is signed in' do
    let(:user) { create :user }

    before do
      sign_in user
    end

    context 'when the user follows another user with posts' do
      let(:tony_stark) { create :tony_stark }

      before do
        user.follow! tony_stark
        create_list :post, 3, user: tony_stark
        req_index
      end

      it { expect(response).to be_successful }

      it 'shows posts of the followed users' do
        tony_stark.posts.each do |post|
          expect(response.body).to have_selector "#post-#{post.id}"
        end
      end
    end

    context 'when the user does not follow anyone but has posts of his own' do
      before do
        create_list :post, 3, user: user
        req_index
      end

      it { expect(response).to be_successful }

      it 'shows his own posts' do
        user.posts.each do |post|
          expect(response.body).to have_selector "#post-#{post.id}"
        end
      end
    end

   context 'when the user does not follow anybody with posts' do
      let(:tony_stark) { create :tony_stark }

      before do
        create_list :post, 3, user: tony_stark
        req_index
      end

      it { expect(response).to be_successful }

      it 'displays no posts at all' do
        Post.all.each do |post|
          expect(response.body).not_to have_selector "#post-#{post.id}"
        end
      end
    end
  end

  context 'when no user is signed in' do
    before do
      req_index
    end

    it { expect(response).not_to be_successful }

    it 'redirects to sign in page' do
      expect(response).to redirect_to new_user_session_path
    end
  end
end
