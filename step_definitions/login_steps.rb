Given('Login successfully') do
    @driver = Selenium::WebDriver.for :chrome
    @driver.get('http://the-internet.herokuapp.com/login')
    @driver.manage.window.resize_to(1340, 708)
    end
  
  When('User enter valid {string} for the username and {string} for the password.') do |string, string2|
    @driver.find_element(:id, 'username').send_keys('tomsmith')
    @driver.find_element(:id, 'password').send_keys('SuperSecretPassword!')
    @driver.find_element(:css, '.fa').click
    end
  
  Then('When the login is successful, it will display the message {string} on top page.') do |string|
    expect(@driver.find_element(:id, 'flash').text.slice! "You logged into a secure area!").to eq(string)
    end
  
  Given('Login failed') do
    @driver = Selenium::WebDriver.for :chrome
    @driver.get('http://the-internet.herokuapp.com/login')
    @driver.manage.window.resize_to(1340, 708)
     end
  
  When('user enter invalid username {string} and password {string}') do |string, string2|  
    @driver.find_element(:id, 'username').send_keys(string)
    @driver.find_element(:id, 'password').send_keys(string2)
    @driver.find_element(:css, '.fa').click
end
  
  Then('When login fails, it will display the message {string} on top page.') do |string|  
    expect(@driver.find_element(:id, 'flash').text.slice! "Your username is invalid!").to eq(string)
end