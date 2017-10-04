class Item < ActiveRecord::Base
  belongs_to :user
  has_one :purchase

  def add_params params
    self.title = params[:title]
    self.description = params[:description]
    self.condition = params[:condition]
    self.price = params[:price]
    self.life_span = params[:life_span]
    self.sold = false
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

end