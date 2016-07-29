require "becario/version"
require "selenium-webdriver"
require "csv"

module Becario
  def self.redmine_url=(redmine_url)
    @redmine_url = redmine_url
  end

  def self.csv=(csv_file)
    @csv = csv_file
  end

  def self.credentials=(credentials)
    @credentials = credentials
  end

  def self.run
    driver = Selenium::WebDriver.for :firefox
    driver.navigate.to @redmine_url

    driver.find_element(id: 'username').send_keys(@credentials[:username])
    driver.find_element(id: 'password').send_keys(@credentials[:password])
    driver.find_element(css: 'input[type="submit"').click

    CSV.foreach(@csv, :headers => true, :header_converters => :symbol, :converters => :all) do |row|
      driver.navigate.to "#{@redmine_url}/issues/#{row[:ticket]}/time_entries/new"

      date = driver.find_element(id: 'time_entry_spent_on')
      date.clear
      date.send_keys(row[:date])

      driver.find_element(id: 'time_entry_hours').send_keys(row[:hours])
      driver.find_element(id: 'time_entry_comments').send_keys(row[:comments])
      select = driver.find_element(id: 'time_entry_activity_id')

      Selenium::WebDriver::Support::Select.new(select).select_by(:text, row[:activity])

      driver.find_element(css: 'input[type="submit"').click
    end

    driver.quit
  end
end
