# frozen_string_literal: true

module WelcomePageElements
  include PageObject
  a(:cornuts_link, id: 'cronuts_link')
  a(:donuts_link, id: 'donuts_link')
end

class DefaultWelcomePage 
  include PageObject
  # include WelcomePageElements
  a(:cornuts_link, id: 'cronuts_link')
  a(:donuts_link, id: 'donuts_link')
  h2(:how_to, id: "how-to-title")

  page_url 'http://localhost:3000'
end

class CustomCronutWelcomePage
  include WelcomePageElements
end
