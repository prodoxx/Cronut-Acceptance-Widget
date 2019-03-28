# frozen_string_literal: true

class WelcomePageElements
  include PageObject
  h1(:welcome_title, id: 'welcome_title')
  a(:cronut_link, id: 'cronut_link')
  a(:donut_link, id: 'donut_link')

  def default_cronut_link_value
    'https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%AE_2_Burnt_Vanilla_Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg'
  end

  def default_donut_link_value
    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/250px-Glazed-Donut.jpg'
  end
end

class DefaultWelcomePage < WelcomePageElements
  page_url 'http://localhost:3000'
end

class CustomCronutWelcomePage < WelcomePageElements
  page_url 'http://localhost:3000?cronuts_url=https://google.com'

  def custom_cronut_link_value
    'https://google.com/'
  end
end

class CustomDonutWelcomePage < WelcomePageElements
  page_url 'http://localhost:3000?donuts_url=https://4chan.org'

  def custom_donut_link_value
    'https://4chan.org/'
  end
end

class CustomCronutDonutWelcomePage < WelcomePageElements
  page_url 'http://localhost:3000?cronuts_url=https://stackoverflow.com&donuts_url=https://stellar.org'

  def custom_cronut_link_value
    'https://stackoverflow.com/'
  end

  def custom_donut_link_value
    'https://stellar.org/'
  end
end
