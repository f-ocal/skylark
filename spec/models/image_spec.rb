require 'rails_helper'

RSpec.describe Image, type: :model do
  let(:image_no_date) { Image.new(
      user_id: 1,
      tileset_name: "Tile Set Name",
      map: "jarjar.8binks",
      description: "What a country!",
      camera_type: "BDSMSLR"
    )}

  describe 'validations' do
    context 'will raise an error' do
      it 'when the date field is empty' do
        image_no_date.save
        expect(image_no_date.errors[:date_taken]).to include("can't be blank")
      end
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
