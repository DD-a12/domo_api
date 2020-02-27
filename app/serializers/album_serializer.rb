class AlbumSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  
  attributes :id, :title, :description, :pictures

  def pictures
    
    object.pictures_attachments.includes(:blob).map do |attachment|
      {
        id: attachment.id,
        name: attachment.name,
        content_type: attachment.blob.filename.to_s,
        url: rails_blob_url(attachment)
      }
    end
  end

end
