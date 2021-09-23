class TemplateRenderer {
  wrapContent(content) {
    return html(
      head() + 
      body(
        applicationTemplate.header() +
        content +
        applicationTemplate.footer()
      )
    );
  }
}