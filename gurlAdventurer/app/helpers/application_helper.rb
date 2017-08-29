module ApplicationHelper
	ITEM_LIFETIME = 86400 * 7 #7 days converted to seconds

	def exp_decay(value,elapsed) #value = current value elapsed = elapsed time in seconds
		decay_fraction = elapsed/ITEM_LIFETIME	
		return value * (Math.exp(1)**(-decay_fraction))
	end

	def update_popularity(item)
			item_time = item.last_decay ? item.last_decay : item.created_at
			time_elapsed = Time.now.utc - item_time 
			item.popularity = exp_decay(item.popularity, time_elapsed) + 1
			item.last_decay = Time.now.utc
			item.save
		end

	def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
