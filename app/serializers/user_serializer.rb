class UserSerializer < ActiveModel::Serializer
  attributes(
    :id,
    :full_name,
    :created_at,
    :updated_at,
    :albums
    )
  
  def albums
    self.object.albums.map do |album|
      {
        title: album.title,
        description: album.description
      }
    end
  end
end
