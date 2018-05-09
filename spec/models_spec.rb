Example for model testing: 
describe 'Dog Class' do
	it 'can create a dog with attributes on initialization' do
		@dog = Dog.new("rudolph", "mastiff", 2)
		expect(@dog.name).to eq("Rudolph")
	end 

	it 'can read dog breed' do
		@dog = Dog.new("rudolph", "mastiff", 2)
		expect(@dog.breed).to eq('mastiff')
	end

	it 'can read dog age' do
		@dog = Dog.new("rudolph", "mastiff", 2)
		expect(@dog.age).to eq(2)
	end 
end 

To test validations: 