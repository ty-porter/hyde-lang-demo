class _template {
  init() {
    var routes = Array(0);

    this.data = Map();
    this.data.set("routes", routes);
  }

  assignRouteData(name, path) {
    var newRoute = Map();

    newRoute.set("name", name);
    newRoute.set("path", path);

    var routes = this.data.get("routes");
    var newRouteArray = Array(1);
    newRouteArray.set(0, newRoute);

    routes = arrayConcat(routes, newRouteArray);
    this.data.set("routes", routes);
  }

  header() {
    return div("header-container",
      h1("header-title text-reverse",
        "Hyde Lang"
      ) +
      this.navbar()
    );
  }

  footer() {
    return div("footer-container",
      div("img-container container",
        a("https://ty-porter.dev",
          img("img-circle img-small", "https://tylerbporter.com/images/headshot.jpg")
        ) +
        p("text-reverse", "&#169; 2021 Tyler Porter with " + a("https://github.com/ty-porter/hyde", "Hyde") + ".")
      )
    );
  }

  navbar() {
    var routes = this.data.get("routes");
    var links = "";

    for (var i = 0; i < routes.length(); i = i + 1) {
      var route = routes.get(i);
      links = links + " " + a(route.get("path"), route.get("name"));
    }

    return div("navbar", links);
  }
}