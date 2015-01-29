class Navegador

	require 'selenium-webdriver'
	require 'nokogiri'

	attr_accessor :driver, :ciudad1, :ciudad2, :fecha

	def initialize(ciudad1 = nil ,ciudad2 = nil,fecha = Date::today)
		@driver = Selenium::WebDriver.for :chrome
		@ciudad1 = ciudad1
		@ciudad2 = ciudad2
		@fecha = fecha
	end

	def get_precio
		@driver.navigate.to("http://www.skyscanner.net/transport/flights/#{@ciudad1}/#{@ciudad2}/#{@fecha.strftime('%y%m%d')}/")
		wait = Selenium::WebDriver::Wait.new(:timeout => 15) # seconds
		wait.until { driver.find_element(:class, "mainquote-price").displayed? }
		return @driver.find_element(:class, "mainquote-price").text.gsub(/[\D]/,'')
	end
end



	
