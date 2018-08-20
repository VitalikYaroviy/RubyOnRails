require 'spec_helper'

RSpec.describe Post do

  context 'validates the post title' do

    let(:post) { FactoryBot.build(:post, title: nil) }

      it 'valid post' do
        expect(post).to_not be_valid
        expect(post.errors[:title]).to have(2).items
      end

  end

  context 'search' do

    let!(:post)  {FactoryBot.create(:post, title: 'hello world')}
    let!(:post2)  {FactoryBot.create(:post, title: 'hello')}
    let!(:post3)  {FactoryBot.create(:post, title: 'hi')}

    context 'regular search' do

      subject { Post.search('hello') }

      it 'searches posts' do
        expect(subject).to have(2).items
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