class QuoteSerializer < ActiveModel::Serializer
  attributes :id, :content, :character, :season, :episode
end
