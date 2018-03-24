$: << File.expand_path("lib", File.dirname(__FILE__))

require "controllers/application_controller"
require "controllers/payments_controller"
require "controllers/recipients_controller"

map("/") {run ApplicationController}
map("/recipients") {run RecipientsController}
map("/payments") {run PaymentsController}
