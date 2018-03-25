$: << File.expand_path("lib", File.dirname(__FILE__))

require "controllers/application_controller"
require "controllers/payments_controller"
require "controllers/recipients_controller"

raise "COOLPAY_APIKEY or COOLPAY_USERNAME is not set" unless ENV['COOLPAY_APIKEY'] && ENV['COOLPAY_USERNAME']

map("/") {run ApplicationController}
map("/recipients") {run RecipientsController}
map("/payments") {run PaymentsController}
