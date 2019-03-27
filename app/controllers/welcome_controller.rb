class WelcomeController < ApplicationController
  def index
    @cronuts_url = params[:cronuts_url]
    @cronuts_url ||= "https://upload.wikimedia.org/wikipedia/commons/8/8b/April_2016_Cronut%C2%AE_2_Burnt_Vanilla_Caramel_-_photo_by_Dominique_Ansel_Bakery.jpg"
    @donuts_url = params[:donuts_url]
    @donuts_url ||= "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Glazed-Donut.jpg/250px-Glazed-Donut.jpg"
    @agreement_text = I18n.t('welcome.index.super_terms_html',
      cronuts_url: @cronuts_url, donuts_url: @donuts_url).html_safe
  end
end
