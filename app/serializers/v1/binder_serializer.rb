class V1::BinderSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :export_path
  has_many :links, serializer: V1::LinkSerializer
end
