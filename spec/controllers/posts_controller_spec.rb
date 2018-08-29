require 'spec_helper'

RSpec.describe PostsController, :type => :controller do

  describe do

    login_user

    context 'action index' do

      let(:post) { FactoryBot.create(:post, title: 'qwert', priority: '5') }

      before do
        get :index
      end

      it 'assigns @posts' do
        # expect(assigns(:posts)).to eq([post])
        expect(response).to render_template('index')
      end

    end

    context 'action new' do

      it 'post should be new' do
        post = FactoryBot.build(:post)
        get :new
        expect(assigns(:post)).to_not eq nil
        expect(assigns(:post)).to be_a_new(Post)
        expect(response).to render_template('new')
      end

    end

    context 'action create' do

      it 'creates a new post' do
        expect{
          post :create, params: {post: FactoryBot.attributes_for(:post)}
        }.to change(Post, :count).by(1)
      end

      it 'redirects to the new post' do
        post :create, params: {post: FactoryBot.attributes_for(:post)}
        expect(response).to redirect_to Post.last
      end

      it 'does not save the new post' do
        expect{
          post :create, params: {post: FactoryBot.attributes_for(:invalid_post)}
        }.to_not change(Post, :count)
      end

      it 're-renders the new method' do
        post :create, params: {post: FactoryBot.attributes_for(:invalid_post)}
        expect(response).to render_template :new
      end

    end

    context 'action update' do

      let!(:post1) {FactoryBot.create(:post, title: 'title1', priority: 1)}

      context do

        it 'changes @post new_title' do
          put :update, params: {id: post1, post: {title: 'b'}}
          post1.reload
          expect(post1.title).to eq('b')
        end

        it 'locates the requested @post' do
          put :update, params: {id: post1, post: FactoryBot.attributes_for(:invalid_post)}
          expect(assigns(:post)).to eq(post1)
        end

        it "does not change @post's attributes" do
          put :update, params: { id: post1, post: FactoryBot.attributes_for(:post, title: 'title2', priority: nil)}
          post1.reload
          expect(post1.title).not_to eq('title2')
          expect(post1.priority).to eq(1)
        end

        it 're-renders the edit method' do
          put :update, params: {id: post1, post: FactoryBot.attributes_for(:invalid_post)}
          expect(response).to render_template :edit
        end

      end
    end


    context 'action destroy' do

      it 'removes post from table' do
        post = FactoryBot.create(:post)
        expect { delete :destroy, params: {id: post} }.to change { Post.count }.by(-1)
      end

    end

    context 'action show' do

      it 'assigns the requested post to @post' do
        post = FactoryBot.create(:post)
        get :show, params: {id: post}
        expect(assigns(:post)).to eq(post)
        expect(response).to render_template :show
      end

    end

    context 'testing my method' do

      it 'method completed' do
        post = FactoryBot.create(:post, statusDelete: false)
        put :completed, params: {id: post}
        post.reload
        expect(post.statusDelete).to eq(true)
      end

    end
  end
end
