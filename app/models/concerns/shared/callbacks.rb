



module Shared::Callbacks
  extend ActiveSupport::Concern

  included do
    before_destroy :remove_activity
    before_destroy :remove_likes
  end

  def remove_activity
    activity = PublicActivity::Activity.find_by(trackable_id: self.id, trackable_type: self.class.to_s, key: "#{self.class.to_s.downcase}.create")
    activity.destroy if activity.present?
    true
  end

  def remove_likes
    activity = PublicActivity::Activity.find_by(trackable_id: self.id, trackable_type: self.class.to_s, key: "#{self.class.to_s.downcase}.like")
    activity.destroy if activity.present?
  end

end
