class Dk2RssEntrySerializer < ActiveModel::Serializer
  attributes:  :title, :summary, :url, :published_at  
end