class Greeter 
	attr_accessor :names
	#Erzeuge Objekt
	def initialize(names)
		@names = names
	end
	
	def sag_hallo
		if @names.nil?
			puts "..."
		elsif @names.respond_to?("each")
			@names.each do |name|
				puts "Hallo #{name}"
			end
		else 
			puts "Hallo #{@names}"
		end
	end
end

ahmet = Greeter.new("ahmet")
ahmet.sag_hallo
ahmet.names = ["ahmet","sulo","abdul","momo"]
ahmet.sag_hallo
puts Greeter.instance_methods