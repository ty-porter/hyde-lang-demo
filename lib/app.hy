class App {
  assignRouter(router) {
    this.router             = router;
    this.httpRequestHandler = BasicHttpRequestHandler(this.router.routes);
  }

  serve() {
    this.router.renderAll();
    this.httpRequestHandler.serve();
  }
}
