# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "jquery", to: "jquery.min.js", preload: true
pin "jquery_ujs", to: "jquery_ujs.js", preload: true
pin "jquery_validate", to: "cdn.jsdelivr.net/npm/jquery-validation@1.19.3/dist/…", preload: true
pin "popper", to: "popper.js", preload: true
pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.2.0/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.5/lib/index.js"
