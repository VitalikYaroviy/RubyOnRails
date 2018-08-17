require 'spec_helper'

RSpec.describe PostsController, :type => :controller do

  describe do
    login_user
    context 'action index' do
      let(:post) { FactoryBot.create(:post, title: 'qwert', priority: '5', user_id: '1') }

      before do
        get :index
      end
      it 'assigns @posts' do
        expect(assigns(:posts)).to eq([post])
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end
    end

    context 'action new'  do
      it 'post should be new' do
        post = FactoryBot.build(:post)
        Post.stub(:new).and_return(post)
        get :new
        expect(assigns(:post)).to eq(post)
      end

      it 'renders the new template' do
        get :new
        expect(response).to render_template('new')
      end
    end

    context 'action create' do
      it 'creates a new post' do
        expect{
          post :create, params: {post: FactoryBot.attributes_for(:post)}
        }.to change(Post,:count).by(1)
      end

      it 'redirects to the new post' do
        post :create, params: {post: FactoryBot.attributes_for(:post)}
        expect(response).to redirect_to Post.last
      end
    end

    context 'action update'  do
      it 'changes @post new_title' do
        post = FactoryBot.create(:post, title: 'a')
        put :update, params: {id: post, post: {title: 'b'}}
        post.reload
        expect(post.title).to eq('b')
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
      end

      it 'render the show template' do
        post = FactoryBot.create(:post)
        get :show, params: {id: post}
        expect(response).to render_template :show
      end
    end

    context 'testing my method'  do

      it 'method remove_all' do
        post = FactoryBot.create(:post, statusDelete: true)
        expect { delete :remove_all, params: {id: post} }.to change { Post.count }.by(-1)
      end

      it 'method completed' do
        post = FactoryBot.create(:post, statusDelete: false)
        put :completed, params: {id: post}
        post.reload
        expect(post.statusDelete).to eq(true)
      end

        it 'method uncheck_all' do
          post = FactoryBot.create(:post, user_id: @user.id, statusDelete: true)
          put :uncheck_all, params: {post: post}
          post.reload
          expect(post.statusDelete).to eq(false)
        end

        it 'method select_all' do
          post = FactoryBot.create(:post, user_id: @user.id, statusDelete: false)
          put :select_all, params: {post: post}
          post.reload
          expect(post.statusDelete).to eq(true)
        end
    end

  end
end
