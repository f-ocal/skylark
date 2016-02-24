require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image_no_date) { Image.new(
      user_id:      1,
      tileset_name: "Tile Set Name",
      map:          "jarjar.8binks",
      description:  "What a country!",
      camera_type:  "BDSMSLR"
  ) }
  let(:image_no_tileset) { Image.new(
      user_id:     1,
      date_taken:  "2015-08-15",
      map:         "jarjar.8binks",
      description: "What a country!",
      camera_type: "BDSMSLR"
  ) }
  let(:image_no_description) { Image.new(
      user_id:      1,
      date_taken:   "2015-08-15",
      map:          "jarjar.8binks",
      tileset_name: "Tile Set Name",
      camera_type:  "BDSMSLR"
  ) }
  let(:image_no_camera) { Image.new(
      user_id:      1,
      date_taken:   "2015-08-15",
      map:          "jarjar.8binks",
      description:  "What a country!",
      tileset_name: "Tile Set Name"
  ) }
  let(:image) { Image.new(
      user_id:      1,
      date_taken:   "2015-08-15",
      map:          "jarjar.8binks",
      description:  "What a country!",
      tileset_name: "Tile Set Name",
      camera_type:  "BDSMSLR"
  ) }

  describe 'validations' do
    context 'will raise an error' do
      it 'when the date field is empty' do
        image_no_date.save
        expect(image_no_date.errors[:date_taken]).to include("can't be blank")
      end
      it 'when the tileset field is empty' do
        image_no_tileset.save
        expect(image_no_tileset.errors[:tileset_name]).to include("can't be blank")
      end
      it 'when the description field is empty' do
        image_no_description.save
        expect(image_no_description.errors[:description]).to include("can't be blank")
      end
      it 'when the camera type field is empty' do
        image_no_camera.save
        expect(image_no_camera.errors[:camera_type]).to include("can't be blank")
      end
    end
    it 'saves the image when the fields are not empty' do
      expect { image.save }.to change { Image.count }.by(1)
    end
  end
end

# Jordan lecagy code, re-adapted
# describe Image do
#   context 'validations' do
#     it { should validate_presence_of :tileset_name }
#     it { should validate_presence_of :date_taken }
#     it { should validate_presence_of :description}
#     it { should validate_presence_of :camera_type }
#   end
# end
