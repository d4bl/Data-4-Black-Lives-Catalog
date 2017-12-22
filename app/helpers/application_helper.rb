



module ApplicationHelper
  def belongs_to_user?(resource)
    resource.user == current_user
  end

  def activity_resources_exist?(activity)
    activity && activity.trackable && activity.owner && activity.trackable.class.to_s != "Event"
  end
end
