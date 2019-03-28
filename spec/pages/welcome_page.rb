# frozen_string_literal: true

class WelcomePageElements
  include PageObject
  h1(:welcome_title, id: 'welcome_title')
  a(:cronut_link, id: 'cronut_link')
  a(:donut_link, id: 'donut_link')

  def cronut_link_value
    'https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%AE_2_Burnt_Vanilla_Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg'
  end

  def donut_link_value
    'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/250px-Glazed-Donut.jpg'
  end
end

class DefaultWelcomePage < WelcomePageElements
  page_url 'http://localhost:3000'
end

class CustomCronutWelcomePage < WelcomePageElements
  page_url 'http://localhost:3000?cronuts_url=https://google.com'

  def cronut_link_value
    'https://google.com/'
  end
end

class CustomDonutWelcomePage < WelcomePageElements
  page_url 'http://localhost:3000?donuts_url=https://4chan.org'

  def donut_link_value
    'https://4chan.org/'
  end
end

class CustomCronutDonutWelcomePage < WelcomePageElements
  page_url 'http://localhost:3000?cronuts_url=https://stackoverflow.com&donuts_url=https://stellar.org'

  def cronut_link_value
    'https://stackoverflow.com/'
  end

  def donut_link_value
    'https://stellar.org/'
  end
end
