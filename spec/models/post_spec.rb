require 'spec_helper'

describe Post do

  context 'validates the post title' do
    let(:post) { FactoryGirl.build(:post, title: nil) }
      it 'valid post' do
        expect(post.valid?).to be_falsey
        expect(post.errors[:title].size).to eq(2)
    end
  end

  context 'search' do
    let!(:post)  {FactoryGirl.create(:post, title: 'hello world')}
    let!(:post2)  {FactoryGirl.create(:post, title: 'hello')}
    let!(:post3)  {FactoryGirl.create(:post, title: 'hi')}

    context 'regular search' do

      subject { Post.search('hello') }

      it 'searches posts' do
        expect(subject.count).to eq 2
        expect(subject).to include(post)
        expect(subject).to include(post2)
      end
    end

    context 'empty serach' do
      it 'returns all posts' do
        expect(Post.search(nil)).to eq(Post.all)
      end
    end

  end

end