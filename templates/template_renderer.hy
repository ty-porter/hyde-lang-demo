class TemplateRenderer {
  wrapContent(title, content) {
    return html(
      head(title) + 
      body(
        applicationTemplate.header() +
        content +
        applicationTemplate.footer()
      )
    );
  }
}