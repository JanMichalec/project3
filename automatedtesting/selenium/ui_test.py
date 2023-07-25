from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.chrome.service import Service

USER = "standard_user"
PASSWORD = "secret_sauce"

print ('Starting the browser...')
options = ChromeOptions()
options.add_argument("--headless") 
service = Service(executable_path=r'/usr/local/bin/chromedriver')
driver = webdriver.Chrome(service=service, options=options)
print ('Browser started successfully. Navigating to the demo page to login.')
driver.get('https://www.saucedemo.com/')
driver.find_element(By.ID,'user-name').send_keys(USER)
driver.find_element(By.ID,'password').send_keys(PASSWORD)
driver.find_element(By.ID,'login-button').click()
print(f"Login user {USER} succesfull!")

# find all 6 items
items = driver.find_elements(By.CLASS_NAME, "inventory_item")
assert len(items) == 6  # make sure that we added all six items on the page

# add to the cart
print("---------- ADDING ITEMS TO THE CART ----------")
for i in items:
    name = i.find_element(By.CLASS_NAME, "inventory_item_name").text
    i.find_element(By.CLASS_NAME, "btn").click()
    print(f"{name} added to the cart.")

# find items in the cart
cart = driver.find_element(By.CLASS_NAME, "shopping_cart_container")
cart.click()

cart_content = driver.find_elements(By.CLASS_NAME, "cart_item")
assert len(cart_content) == 6  # make sure that the cart has 6 items

# remove from the cart
print("---------- REMOVING ITEMS FROM THE CART ----------")
for i in cart_content:
    name = i.find_element(By.CLASS_NAME, "inventory_item_name").text
    i.find_element(By.CLASS_NAME, "btn").click()
    print(f"{name} removed from the cart.")
