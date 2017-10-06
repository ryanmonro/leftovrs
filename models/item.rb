class Item < ActiveRecord::Base
  belongs_to :user
  has_one :purchase

  def add_params params
    self.title = params[:title]
    self.description = params[:description]
    self.condition = params[:condition]
    self.price = params[:price]
    self.life_span = params[:life_span]
    self.latitude = params[:latitude]
    self.longitude = params[:longitude]
    self.sold = false
    self.collected = false
    self.save
    self
  end

  def formatted_price
    if !price
      ""
    elsif price == 0
      "FREE"
    else
      sprintf("$%.2f", price)
    end
  end

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