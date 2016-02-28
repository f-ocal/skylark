require 'rails_helper'

RSpec.describe ImagesController do
  let(:user) { User.create(username: 'skylark', email: 'someone@gmail.com', password: 'skylark1') }
  let(:file_to_upload) { fixture_file_upload('export.tiff', 'image/tiff') }
  before do
    sign_in user
  end

  describe '#create' do
    let(:tileset_name) { 'Fatma image' }
    let(:description) { 'This is an image' }
    let(:camera_type) { 'Canon Camera'}
    let(:date_string) { '2016-12-02'}
    let(:params) do
      {
          image: {
              tileset_name: tileset_name,
              description:  description,
              camera_type:  camera_type,
              date_taken:   date_string,
              image_file:   file_to_upload
          }
      }
    end

    describe 'happy path' do
      it 'calls the MapBoxService to upload files' do
        expect_any_instance_of(MapBoxService).to receive(:upload_file).with(file_to_upload, tileset_name)
        post :create, params
      end

      it 'redirects to user profile path' do
        get :create, params
        expect(response).to redirect_to user_path(user)
      end

      it 'sets the flash message' do
        post :create, params
        expect(flash[:success]).to eq ["Upload in process for #{tileset_name}. This may take a few minutes."]
      end

      it 'saves the image record' do
        post :create, params

        image = Image.last
        expect(image.tileset_name).to eq tileset_name
        expect(image.description).to eq description
        expect(image.camera_type).to eq camera_type
        expect(image.date_taken).to eq Date.parse(date_string)
      end
    end

    describe 'validation errors' do
      it 'renders new if image node is missing' do
        post :create
        expect(response).to render_template 'images/new'
      end

      it 'sets a flash message if image node is missing' do
        post :create
        expect(flash[:error]).to eq ['Something went wrong. Please try again.']
      end

      it 'renders new if image fails activerecord validation' do
        allow_any_instance_of(Image).to receive(:save).and_return(false)
        post :create, params
        expect(response).to render_template 'images/new'
      end

      it 'sets a flash message if image node is missing' do
        allow_any_instance_of(Image).to receive(:save).and_return(false)
        allow_any_instance_of(Image).to receive(:errors).and_return(double(full_messages: ['error']))

        post :create, params
        expect(flash[:error]).to eq ['error']
      end

    end
  end
end

