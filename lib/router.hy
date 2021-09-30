class Router {
  init() {    
    this.routes = Array(0);
  }

  defineRoute(renderer, path, name) {
    var route = Map();

    # Insert a subset of route data into applicationTemplate
    applicationTemplate.assignRouteData(name, path);

    route.set("path", path);
    route.set("name", name);
    route.set("template_location", renderer.templateLocation);
    route.set("renderer", renderer);

    var combinedRoutes = arrayAppend(this.routes, route);
    this.routes = combinedRoutes;
  }

  printRoutes() {
    print "-------";
    print "Routes:";
    print "-------";

    for (var i = 0; i < this.routes.length(); i = i + 1) {
      var route = this.routes.get(i);

      print "  _____________________________________________";
      print "      name: " + route.get("name");
      print "      path: " + route.get("path");
      print "  template: " + route.get("template_location");
    }
  }

  renderAll() {
    for (var i = 0; i < this.routes.length(); i = i + 1) {
      var route = this.routes.get(i);
      var renderer = route.get("renderer");

      route.set("data", renderer.renderContent());

      this.routes.set(i, route);
    }
  }
}