class Client < ApplicationRecord
	require 'csv'

	validates :name, presence: true
	validates :annual_income, presence:true, numericality: true
	
	before_create do
      self.tax = calculate_tax(self.annual_income)
    end

	def calculate_tax(annual_income)
	  
	  tax_brackets=[
			[10000,0.1],
			[20000,0.2],
			[50000,0.3]
		]
		tax=0

		tax_brackets.each {|val, percentage| tax += (annual_income- val)*percentage if annual_income>val }	  
	    tax
	end
  
  def self.import(file)
    data=CSV.read(file, { encoding: "UTF-8", headers: true, header_converters: :symbol, converters: :all})
    raise Exception.new('Missing required file') unless data
     
    clients_data = data.map { |d| d.to_hash }
    clients_data.each do |client|
    	if client[:annual_income].to_s.match?(/\A-?\d+\Z/)&& !client[:annual_income].to_s.to_f.negative?()
          Client.create! client
    	end

    end
  
  end


end
