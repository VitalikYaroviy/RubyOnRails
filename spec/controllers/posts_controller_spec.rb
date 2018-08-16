RSpec.describe PostsController do
  describe do

    # before do
    #   @user = FactoryGirl.create(:user, email: 'test@gmail.com', password: '123456')
    #   sign_in @user
    # end

    context "action index" do
      before do
        @post = FactoryGirl.create(:post, title: 'qwert', priority: '5', user_id: '1')
        get :index
      end
      it "assigns @posts" do
        expect(assigns(:posts)).to eq([@post])
      end

      it "renders the index template" do
        get :index
        expect(response).to render_template("index")
      end
    end

    context "action new"  do
      it "post should be new" do
        post = FactoryGirl.build(:post)
        Post.stub(:new).and_return(post)
        get :new
        expect(assigns(:post)).to eq(post)
      end

      it "renders the new template" do
        get :new
        expect(response).to render_template("new")
      end
    end
  end
end