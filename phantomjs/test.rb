require 'bundler/setup'
require 'capybara/poltergeist'
Bundler.require

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {:js_errors => false, :timeout => 100 })
end
session = Capybara::Session.new(:poltergeist)
session.visit "https://entry11.bk.mufg.jp/ibg/dfw/APLIN/loginib/login?_TRANID=AA000_001&link_id=login_1&GYO_CD=12"

session.fill_in "KEIYAKU_NO", :with => '111'
session.fill_in "PASSWORD", :with => '111'
session.save_screenshot 'screenshot.png'