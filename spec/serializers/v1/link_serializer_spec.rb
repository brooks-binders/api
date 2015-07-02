require 'rails_helper'

RSpec.describe V1::LinkSerializer, :type => :serializer do

  context 'Individual Resource Representation' do

    let(:link) { build(:link) }
    let(:serializer) { V1::LinkSerializer.new(link) }

    subject do
      JSON.parse(serializer.to_json)
    end

    it 'has an id' do
      expect(subject['id']).to eql(link.id)
    end

    it 'has a url' do
      expect(subject['url']).to eql(link.url)
    end
  end

end
