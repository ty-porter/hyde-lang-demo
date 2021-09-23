class HTMLGenerator {
  init() {
    # Tag types
    this.aTag    = "a";
    this.divTag  = "div";
    this.h1Tag   = "h1";
    this.h2Tag   = "h2";
    this.iTag    = "i";
    this.imgTag  = "img";
    this.liTag   = "li";
    this.pTag    = "p";
    this.spanTag = "span";
    this.ulTag   = "ul";

    # Static tags
    this.hr      = "<hr />";

    # HTMLGenerator constants
    this.CSS_PATH     = "static/css/styles.css";
    this.FAVICON_PATH = "static/ico/favicon-32x32.png";
  }

  a(href, text) {
    var attribute = "href='" + href + "'";

    return this.wrapAttributes(this.aTag, text, attribute);
  }

  body(enclosing) {
    return this.wrapClass("body", enclosing, None);
  }

  div(htmlClass, text) {
    return this.wrapClass(this.divTag, text, htmlClass);
  }

  head() {
    return this.wrapAttributes("head", this.css() + " " + this.favIcon(), None);
  }

  h1(htmlClass, text) {
    return this.wrapClass(this.h1Tag, text, htmlClass);
  }

  h2(htmlClass, text) {
    return this.wrapClass(this.h2Tag, text, htmlClass);
  }

  html(enclosing) {
    return this.wrapAttributes("html", enclosing, None);
  }

  i(htmlClass, text) {
    return this.wrapClass(this.iTag, text, htmlClass);
  }

  img(htmlClass, src) {
    var formattedSrc   = this.formatAttribute(src, "src");
    var formattedClass = this.formatClass(htmlClass);

    return this.wrapSelfClosingTag(this.imgTag, this.formatAttributes(formattedSrc + " " + formattedClass));
  }

  li(htmlClass, text) {
    return this.wrapClass(this.liTag, text, htmlClass);
  }

  link(rel, type, href) {
    var relAttribute  = "rel='" + rel + "'";
    var typeAttribute = "type='" + type + "'";
    var hrefAttribute = "href='" + href + "'";
    var attributes    = relAttribute + " " + hrefAttribute;

    return this.wrapSelfClosingTag("link", attributes);
  }

  p(htmlClass, text) {
    return this.wrapClass(this.pTag, text, htmlClass);
  }

  span(htmlClass, text) {
    return this.wrapClass(this.spanTag, text, htmlClass);
  }

  ul(htmlClass, text) {
    return this.wrapClass(this.ulTag, text, htmlClass);
  }

  # Helpers
  css() {
    return this.link("stylesheet", "text/css", this.CSS_PATH);
  }

  favIcon() {
    return this.link("shortcut icon", "", this.FAVICON_PATH);
  }

  formatAttribute(attribute, type) {
    var formattedAttribute = "";

    if (attribute != None) {
      formattedAttribute = " " + type + "='" + attribute + "'";
    }

    return formattedAttribute;
  }

  formatAttributes(attributes) {
    var formattedAttributes = "";

    if (attributes != None) {
      formattedAttributes = " " + attributes;
    }

    return formattedAttributes;
  }
 
  formatClass(htmlClass) {
    var formattedClass = "";
    
    if (htmlClass != None) {
      formattedClass = "class='" + htmlClass + "'";
    }

    return formattedClass;
  }

  wrapClass(tagType, text, htmlClass) {
    var formattedClass = this.formatClass(htmlClass);

    if (text == None) {
      text = "";
    }

    return this.wrapAttributes(tagType, text, formattedClass);
  }

  wrapAttributes(type, text, attributes) {
    var formattedAttributes = this.formatAttributes(attributes);

    if (text == None) {
      text = "";
    }

    return "<" + type + formattedAttributes + ">" + text + "</" + type + ">";
  }

  wrapSelfClosingTag(type, attributes) {
    var formattedAttributes = this.formatAttributes(attributes);

    return "<" + type + formattedAttributes + "/>";
  }
}

var htmlGenerator = HTMLGenerator();

var a    = htmlGenerator.a;
var body = htmlGenerator.body;
var div  = htmlGenerator.div;
var i    = htmlGenerator.i;
var img  = htmlGenerator.img;
var head = htmlGenerator.head;
var h1   = htmlGenerator.h1;
var h2   = htmlGenerator.h2;
var html = htmlGenerator.html;
var li   = htmlGenerator.li;
var p    = htmlGenerator.p;
var span = htmlGenerator.span;
var ul   = htmlGenerator.ul;

var hr   = htmlGenerator.hr;