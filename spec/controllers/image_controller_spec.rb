require 'rails_helper'

RSpec.describe ImagesController, type: :controller do

end


# Jordan's example code
# describe ArticlesController do
#   let(:article) { FactoryGirl.create :article}
#   let(:attributes) { FactoryGirl.attributes_for :article}
#   describe "GET #index" do
#     before(:each) do
#       get :index
#     end
#     it "responds with a 200" do
#       expect(response.status).to eq(200)
#     end
#     it "assigns the articles instance variable" do
#       expect(assigns(:articles)).to be_a(ActiveRecord::Relation)
#     end
#     it "assigns the article instance variable" do
#       expect(assigns(:article)).to be_a(Article)
#     end
#   end

#   describe 'POST #create' do
#     it "saves a new article in the database" do
#       expect{
#       post :create, :article => attributes}.to change{ Article.count}.by(1)
#     end
#     it "redirects to the root path" do
#       post :create, :article => attributes
#       expect(response.status).to eq(302)
#     end
#   end
#   describe 'GET #show' do
#     before(:each) do
#       get :show, id: article.id
#     end
#     it "assigns the article instance variable" do
#       expect(assigns(:article)).to be_a(Article)
#     end
#   end
#   describe 'PUT #update' do
#     let!(:title) { "A treatise on Malomars." }
#     it 'updates a field on an article' do
#       put :update, id: article.id, article: { title: title, body: article.body }
#       expect(article.reload.title).to eq(article.title)
#     end
#   end
#   describe 'DELETE #destroy' do
#     it 'decrements articles by one' do
#       article_id = article.id
#       expect {
#         delete :destroy, id: article_id
#       }.to change{ Article.count }.by(-1)
#     end
#     it 'redirects to the root path' do
#       article_id = article.id
#       delete :destroy, id: article_id
#       expect(response.status).to eq(302)
#     end
#   end

# end
