require 'rails_helper'

# RSpec.describe Image, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

# Jordan lecagy code, re-adapted
describe Image do
  context 'validations' do
    it { should validate_presence_of :tileset_name }
    it { should validate_presence_of :date_taken }
    it { should validate_presence_of :description}
    it { should validate_presence_of :camera_type }
  end
end
