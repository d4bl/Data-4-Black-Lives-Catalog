class Post < ActiveRecord::Base
  include Shared::Callbacks

  belongs_to :user
  counter_culture :user
  acts_as_commentable
  acts_as_taggable_on :tags

  include PublicActivity::Model
  tracked only: [:create, :like], owner: proc { |_controller, model| model.user }

  default_scope -> { order('created_at DESC') }

  mount_uploader :attachment, AvatarUploader

  validates_presence_of :content
  validates_presence_of :user

  auto_html_for :content do
    image
    youtube(width: 400, height: 250, autoplay: true)
    link target: '_blank', rel: 'nofollow'
    simple_format
  end

  def self.search(search)
    where("name LIKE ?", "%#{search}%")
    where("content LIKE ?", "%#{search}%")
  end

end
