require_relative "lib/controllers/application_controller.rb"
require_relative "lib/controllers/payments_controller.rb"
require_relative "lib/controllers/recipients_controller.rb"

map("/") {run ApplicationController}
map("/recipients") {run RecipientsController}
map("/payments") {run PaymentsController}
