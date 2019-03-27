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
    # include PageObject::PageFactory
    it '(HAPPY) should see the default Cronut acceptance widget' do
      visit DefaultWelcomePage do |page|
        expect(page.how_to_element.present?).to eq true
      end
      # cronuts_link = a(id: 'cronuts_link')
      # expect(cronuts_link).to be_present
    end
  end
end
