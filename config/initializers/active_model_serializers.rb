ActiveSupport.on_load(:active_model_serializers) do
  # Disable for all serializers (except ArraySerializer)
  ActiveModel::Serializer.root = false

  # Disable for ArraySerializer
  ActiveModel::ArraySerializer.root = false
end

ActiveModel::Serializer.setup do |config|
  config.root = false
  config.key_format = :lower_camel
end
