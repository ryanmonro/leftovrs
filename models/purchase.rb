class Purchase < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  
  def age
    time_difference = Time.now - self.created_at
    seconds = time_difference.to_i
    if seconds < 60
      return "#{seconds} seconds"
    end
    minutes = seconds / 60
    if minutes < 60
      return "#{minutes} minutes"   
    end
    hours = minutes / 60
    if hours < 24
      return "#{hours} hours"
    end
    days = (hours / 24.0).round(0)
    return "#{days} days"
  end
end