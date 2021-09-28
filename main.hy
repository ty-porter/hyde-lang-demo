load "lib/app.hy";
load "lib/router.hy";
load "lib/utils/html_generator.hy";

# Route loading
var router = Router();

# Template assignment
load "templates/_application_template.hy";
var applicationTemplate = _template();

# View loading into router
load "templates/index.html.hy";
var indexRenderer = _renderer();
router.defineRoute(indexRenderer, "/", "main");

load "templates/about.html.hy";
var aboutRenderer = _renderer();
router.defineRoute(aboutRenderer, "/about", "about");

# Assign router to app
var app = App();
app.assignRouter(router);

# Debug
app.router.printRoutes();

# Start the server!
app.serve();