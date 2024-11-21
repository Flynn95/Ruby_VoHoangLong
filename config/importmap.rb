# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "local-time" # @3.0.2
pin "bootstrap", to: "bootstrap.min.js", preload: true # @5.3.3
pin "@popperjs/core", to: "popper.js", preload: true # @2.11.8