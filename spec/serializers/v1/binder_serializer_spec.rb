require 'rails_helper'

RSpec.describe V1::BinderSerializer, :type => :serializer do

  context 'Individual Resource Representation' do

    let(:binder) { build(:binder) }
    let(:serializer) { V1::BinderSerializer.new(binder) }

    subject do
      JSON.parse(serializer.to_json)
    end

    it 'has an id' do
      expect(subject['id']).to eql(binder.id)
    end

    it 'has a name' do
      expect(subject['name']).to eql(binder.name)
    end

    it 'has a description' do
      expect(subject['description']).to eql(binder.description)
    end

    it 'has an exportPath' do
      expect(subject['exportPath']).to eql(binder.export_path)
    end
  end

end
