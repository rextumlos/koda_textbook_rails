class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :published, :image, :user, :comments_count, :created_at

  def user
    {
      id: object.user.id,
      name: object.user.name,
      email: object.user.email
    }
  end
end
