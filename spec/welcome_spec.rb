# frozen_string_literal: true

require_relative 'rails_helper'
require_relative 'pages/welcome_page.rb'

RSpec.describe 'WelcomePage' do
  before do
    unless @browser
      @browser = Watir::Browser.new
      # @headless = Headless.new
    end
  end

  after do
    @browser.close
    # @headless.destroy
  end

  describe 'Default Welcome Page' do
    it '(HAPPY) should see the default Cronut acceptance widget' do
      # GIVEN: user is on the welcome page with the default
      #        Cronut acceptance widget
      visit DefaultWelcomePage do |page|
        # THEN: user should see a Welcome message and default
        #       cronut widget with default links
        expect(page.welcome_title_element).to be_present
        expect(page.welcome_title).to eq 'Welcome!'
        expect(page.cronut_link_element).to be_present
        expect(page.cronut_link_element.href).to(
          eq page.default_cronut_link_value) # default value
        expect(page.donut_link_element).to be_present
        expect(page.donut_link_element.href).to(
          eq page.default_donut_link_value) # default value
      end
    end

    it '(SAD) should check if both default cronuts and
      donut link are not changed' do
        # GIVEN: user is on the welcome page with the
        #        default Cronut acceptance widget
        visit DefaultWelcomePage do |page|
          # THEN: user should see the cronut link pointing to default link
          # ALSO: the donut link pointing to default link
          expect(page.cronut_link_element).to be_present
          expect(page.cronut_link_element.href).not_to(
            eq 'https://oblip.com')
          expect(page.donut_link_element).to be_present
          expect(page.donut_link_element.href).not_to(
            eq 'https://reggieescobar.com')
        end
    end
  end

  describe 'Custom Cronut Link Welcome Page' do
    it '(HAPPY) should see that only the cronut link
      changed from the default' do
        # GIVEN: user is on the welcome page with only the
        #        custom cronut link provided
        visit CustomCronutWelcomePage do |page|
          # THEN: user should see a Welcome! message and the
          #       cronut link pointing to https://google.com
          # ALSO: the donut link should remain as the default value
          expect(page.welcome_title_element).to be_present
          expect(page.welcome_title).to eq 'Welcome!'
          expect(page.cronut_link_element).to be_present
          expect(page.cronut_link_element.href).to(
            eq page.custom_cronut_link_value) # https://google.com
          expect(page.donut_link_element).to be_present
          expect(page.donut_link_element.href).to(
            eq page.default_donut_link_value) # default value
        end
    end

    it '(SAD) should confirm that the cronut link is
      not pointing to default link' do
        # GIVEN: user is on the welcome page with only
        #        custom cronut link provided
        visit CustomCronutWelcomePage do |page|
        # THEN: user should see the cronut link not pointing
        #       to default link
        # ALSO: the donut link pointing to default link
        expect(page.cronut_link_element).to be_present
        expect(page.cronut_link_element.href).not_to(
          eq page.default_cronut_link_value) # should be https://google.com/
        expect(page.donut_link_element).to be_present
        expect(page.donut_link_element.href).to(
          eq page.default_donut_link_value) # default value
        end
    end
  end

  describe 'Custom Donut Link Welcome Page' do
    it '(HAPPY) should see that only the donut link
      changed from the default' do
        # GIVEN: user is on the welcome page with only a
        #        custom donut link provided changed
        visit CustomDonutWelcomePage do |page|
          # THEN: user should see a Welcome! message and the
          #       donut link pointing to https://4chan.org/
          # ALSO: the cronut link should remain as the default value
          expect(page.welcome_title_element).to be_present
          expect(page.welcome_title).to eq 'Welcome!'
          expect(page.cronut_link_element).to be_present
          expect(page.cronut_link_element.href).to(
            eq page.default_cronut_link_value) # default value
          expect(page.donut_link_element).to be_present
          expect(page.donut_link_element.href).to(
            eq page.custom_donut_link_value) # https://4chan.org/
        end
    end

    it '(SAD) should confirm that the donut link is not pointing
      to default link' do
        # GIVEN: user is on the welcome page with only custom 
        #        donut link provided
        visit CustomDonutWelcomePage do |page|
        # THEN: user should see the donut link not pointing to
        #       default link
        # ALSO: the cronut link pointing to default link
        expect(page.cronut_link_element).to be_present
        expect(page.cronut_link_element.href).to(
          eq page.default_cronut_link_value) # default value
        expect(page.donut_link_element).to be_present
        expect(page.donut_link_element.href).not_to(
          eq page.default_donut_link_value) # should be https://4chan.org/
        end
    end
  end

  describe 'Custom Cronut and Donut Link Welcome Page' do
    it '(HAPPY) should see that both the cronut and the donut
      link changed from the default' do
        # GIVEN: user is on the welcome page with both custom cronut
        #        and donut link provided changed
        visit CustomCronutDonutWelcomePage do |page|
          # THEN: user should see a Welcome! message and the cronut
          #       link pointing to https://stackoverflow.com/
          # ALSO: the donut be pointing to https://stellar.org
          expect(page.welcome_title_element).to be_present
          expect(page.welcome_title).to eq 'Welcome!'
          expect(page.cronut_link_element).to be_present
          expect(page.cronut_link_element.href).to(
            eq page.custom_cronut_link_value) # https://stellar.org/
          expect(page.donut_link_element).to be_present
          expect(page.donut_link_element.href).to(
            eq page.custom_donut_link_value) # https://4chan.org/
        end
    end

    it '(SAD) should confirm that the cronut and donut link
      is not pointing default links' do
        # GIVEN: user is on the welcome page with only custom
        # cronut link provided
        visit CustomCronutDonutWelcomePage do |page|
        # THEN: user should see the cronut link not pointing
        #       to default link
        # ALSO: the donut link not pointing to default link
        expect(page.cronut_link_element).to be_present
        expect(page.cronut_link_element.href).not_to(
          eq page.default_cronut_link_value) # should be https://stackoverflow.com/
        expect(page.donut_link_element).to be_present
        expect(page.donut_link_element.href).not_to(
          eq page.default_donut_link_value) # should be https://stellar.org/
        end
    end
  end
end
