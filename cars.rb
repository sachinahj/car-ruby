system('cls')

class Car
	@@total_car_count = 0
	@@cars_per_color = {}
	attr_reader :color

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color = "blue")
		@fuel = 10
		@distance = 0
		@color = color
		if @@cars_per_color[color] != nil
			@@cars_per_color[color] += 1
		else
			@@cars_per_color[color] = 1
		end
		@@total_car_count += 1
	end

	def color=(color)
		@@cars_per_color[@color] -= 1
		if @@cars_per_color[color] != nil
			@@cars_per_color[color] += 1
		else
			@@cars_per_color[color] = 1
		end
		@color = color
	end

	def self.most_popular_color
		n = @@cars_per_color.sort_by {|x,y| y}
		return n[-1][0]
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end

	def self.total_car_count
		@@total_car_count
	end

	def self.cars_per_color
		@@cars_per_color
	end
end

class ConvertibleCar < Car
	attr_reader :roof_status
	def initialize(color = "blue", roof_status = "closed")
		super(color)
		@roof_status = roof_status
	end
	def top_down
		@roof_status = "open"
	end
	def close_top
		@roof_status = "closed"
	end
end

# car_a = Car.new()
# car_b = Car.new()
# puts car_a
# puts car_b
# car_a.drive(10)
# puts car_a
# puts car_b
# car_a.drive(232)
# car_b.drive(117)
# puts car_a
# puts car_b

a = Car.new("red")
b = Car.new("orange")
c = Car.new("yellow")
d = Car.new("green")
e = Car.new("blue")
f = Car.new("purple")
g = Car.new("blue")
h = Car.new("black")
puts Car.total_car_count
p Car.cars_per_color
f.color = "blue"
p Car.cars_per_color
p Car.most_popular_color

i = ConvertibleCar.new()
puts Car.total_car_count
p Car.cars_per_color
p i.color
i.top_down
p i.roof_status
