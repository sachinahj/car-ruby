system('clear')

class Car
	def initialize
		@distance = 0
		@fuel = 10.0
		puts "The initialize method has run automatically"
	end
	def get_info
		puts "Driven #{@distance} miles and have #{@fuel} gallons of fuel remaining"
	end
	def drive(miles)
		if (miles/20.0) > @fuel
			puts "You don't have enough gas to drive that far; fuel_up"
		else
			@distance += miles
			@fuel -= miles/20.0
		end
	end
	def fuel_up(gallons)
		if (gallons + @fuel) > 10
			puts "Your tank can only handle 10 gallons"
		else
			puts "You have added #{gallons} gallons to your tank which has cost you $#{gallons * 3.5}"
			@fuel += gallons
		end
	end

end

car_a = Car.new
car_b = Car.new

car_a.get_info

car_a.drive(200)
car_a.drive(2)
car_a.fuel_up(11)
car_a.fuel_up(10)
car_a.drive(2)

car_a.get_info



