class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.delete('$').to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    if @price >= 500000
      true
    else
      false
    end
  end

  def rooms_from_category(category)
    rooms_in_category = rooms.find_all do |room|
      room.category == category
    end
    rooms_in_category
  end

  def area
    area_of_all_rooms = rooms.sum do |room|
      room.area
    end
    area_of_all_rooms
  end

  def details
    details_hash = {"price" => @price, "address" => @address}
    details_hash
  end

  def price_per_square_foot
    (@price.to_f / area).round(2)
  end

  def rooms_sorted_by_area
    sorted_by_area = @rooms.sort_by do |room|
      room.area
    end
    sorted_by_area.reverse
  end

  # def rooms_by_category
  #   sorted_by_category = {}
  #   @rooms.sort_by do |room|
  #     room.category
  #   end
  # end
end
