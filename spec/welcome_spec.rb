# frozen_string_literal: true

RSpec.describe 'WelcomePage' do
  before do
    unless @browser
      @browser = Watir::Browser.new
    end
  end

  after do
    @browser.close
  end

  describe 'Default Welcome Page' do
    it '(HAPPY) should see the default Cronut acceptance widget' do
      # GIVEN: user is on the welcome page with the default Cronut acceptance widget
      visit DefaultWelcomePage do |page|
        # THEN: user should see a Welcome message and default cronut widget with default links
        expect(page.welcome_title_element).to be_present
        expect(page.welcome_title).to eq 'Welcome!'
        expect(page.cronut_link_element).to be_present
        expect(page.cronut_link_element.href).to eq page.cronut_link_value # default value
        expect(page.donut_link_element).to be_present
        expect(page.donut_link_element.href).to eq page.donut_link_value # default value
      end
    end

    it '(SAD) should check if both default cronuts and donut link are not changed' do
      # GIVEN: user is on the welcome page with the default Cronut acceptance widget
      visit DefaultWelcomePage do |page|
        expect(page.cronut_link_element).to be_present
        expect(page.cronut_link_element.href).not_to eq 'https://oblip.com'
        expect(page.donut_link_element).to be_present
        expect(page.donut_link_element.href).not_to eq 'https://reggieescobar.com'
      end
    end
  end

  describe 'Custom Cronut Link Welcome Page' do
    it '(HAPPY) should see that only the cronut link changed from the default' do
      # GIVEN: user is on the welcome page with only the custom cronut link provided
      visit CustomCronutWelcomePage do |page|
        # THEN: user should see a Welcome! message and the cronut link pointing to https://google.com
        # ALSO: the donut link should remain as the default value
        expect(page.welcome_title_element).to be_present
        expect(page.welcome_title).to eq 'Welcome!'
        expect(page.cronut_link_element).to be_present
        expect(page.cronut_link_element.href).to eq page.cronut_link_value # https://google.com
        expect(page.donut_link_element).to be_present
        expect(page.donut_link_element.href).to eq page.donut_link_value # default value
      end
    end

    it '(SAD) should confirm that the cronut link is not pointing to https://oblip.com' do
       # GIVEN: user is on the welcome page with only custom cronut link provided
       visit CustomCronutWelcomePage do |page|
        expect(page.cronut_link_element).to be_present
        expect(page.cronut_link_element.href).not_to eq 'https://oblip.com' # it should be https://google.com
        expect(page.donut_link_element).to be_present
        expect(page.donut_link_element.href).to eq page.donut_link_value # default value
       end
    end
  end

  describe 'Custom Donut Link Welcome Page' do
    it '(HAPPY) should see that only the donut link changed from the default' do
      # GIVEN: user is on the welcome page with only a custom donut link provided changed
      visit CustomCronutWelcomePage do |page|
        # THEN: user should see a Welcome! message and the cronut link pointing to https://google.com
        # ALSO: the cronut link should remain as the default value
        expect(page.welcome_title_element).to be_present
        expect(page.welcome_title).to eq 'Welcome!'
        expect(page.cronut_link_element).to be_present
        expect(page.cronut_link_element.href).to eq page.cronut_link_value # default value
        expect(page.donut_link_element).to be_present
        expect(page.donut_link_element.href).to eq page.donut_link_value # 'https://4chan.org'
      end
    end

    it '(SAD) should confirm that the donut link is not pointing to https://oblip.com' do
       # GIVEN: user is on the welcome page with only custom cronut link provided
       visit CustomCronutWelcomePage do |page|
        expect(page.cronut_link_element).to be_present
        expect(page.cronut_link_element.href).to eq page.cronut_link_value # default value
        expect(page.donut_link_element).to be_present
        expect(page.donut_link_element.href).not_to eq 'https://oblip.com' # it should be https://4chan.org
       end
    end
  end
end
