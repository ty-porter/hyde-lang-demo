
load "templates/template_renderer.hy";

class _renderer < TemplateRenderer {
  init() {
    this.templateLocation = "templates/about.html.hy";
  }

  renderContent() {
    return this.wrapContent(
      "Hyde - About",
      div("title-container container",
        h1("article-title",
          "About Hyde Lang"
        )
      ) + 
      div("paragraph-container container",
        div(None,
          p(None, "Just like " + a("https://en.wikipedia.org/wiki/Strange_Case_of_Dr_Jekyll_and_Mr_Hyde", "the novel of the same name") + ", where the evil Mr. Hyde " +
            "is the antithesis of the benevolent Dr. Jekyll, this scripting language, " + a("https://github.com/ty-porter/hyde", "Hyde") + ", is the polar opposite, " +
            "often masochistic, and downright hard-to-use alternative to " + a("https://jekyllrb.com/", "Jekyll") + "."
          ) + 
          p(None, "Hyde is a toy language written to prove that just because something " + i(None, "can") + " be done... Sometimes it's best not to.") +
          p(None, "Jekyll is truly a joy to use -- simply write articles in Markdown and your content is served easily and quickly. " + 
            "Because it's built on top of Ruby, you know it's made for developer happiness. In fact, you can see an example of a Jekyll static site in action if you " +
            "take a look at " + a("https://blog.ty-porter.dev", "my blog") + " (and you should, since I have a more complete writeup of Hyde there as well as many other " +
            " cool projects to look at)."
          ) + 
          p(None, "Hyde, on the other hand, is an evil, deviously hard-to-use alternative to Jekyll. It will punish you for using it. It is a scripting language written " +
            "in the span of a few weeks, and none of its features are built for rendering large bodies of HTML. It has a spartan standard library, limited primitive types, " +
            "and barely passable error handling."
          ) +
          p(None, "However, somehow, I've used it to write a simple webserver (!) and serve this content to you.")
        )
      ) + hr + 
      div("paragraph-container container",
        div(None, h2(None, "Origins in Lox")) +
        div(None,
          p(None, "As mentioned on the " + a("/main", "main page") + ", Hyde has its origins as a Python implementation of " + 
            a("https://craftinginterpreters.com/", "Lox by Robert Nystrom") + "."
          ) +
          p(None, "I've taken additional liberties with the source code from his book, such as adding " + span("inline-code", "Array") + " and " + span("inline-code", "Map") + " " +
            "types."
          ) +
          p(None, "You'll also notice you can, y'know, " + i(None, "read this") + " which means I've also implemented an HTTP webserver. This is built on top of " +
            span("inline-code", "http.server") + " module which can be found in the Python standard library. The Hyde webserver can serve static HTML, CSS, fonts, images, and more, " +
            "so it's 100% responsible for all the content you see. No linked stylesheets here!"
          ) +
          p(None, "The only other feature I've added is a " + span("inline-code", "load") + " keyword to load other files -- otherwise this simple webserver would have " +
            "had to be implemented in a single monolithic " + span("inline-code", ".hy") + " script, and Hyde is " + i(None, "plenty") + " terrifying to work with as-is." 
          )
        )
      ) + hr +
      div("paragraph-container container",
        div(None, h2(None, "Bootstrapping Hyde")) + 
        div(None,
          p(None, "Since Hyde is written in Python, it can be installed quite simply with " + span("inline-code", "pip install hyde-lang") + ".") +
          p(None, "From there, it's simply a matter of either running the interpreter (" + span("inline-code", "hyde") + "), or passing a script to interpret (" +
            span("inline-code", "hyde main.hy") + ", for instance)."
          ) +
          p(None, "This site, for instance, is running on Heroku, and the entry point for serving content is simply " + span("inline-code", "hyde main.hy") + ". There is no Python " +
            "code present in this repo."
          )
        )
      ) + hr +
      div("paragraph-container container",
        div(None, h2(None, "The Hyde Webserver")) + 
        div(None,
          img(None, "/static/images/hyde_server.png") +
          p(None, i(None, "(This is a screenshot because I didn't feel like writing my own Hyde code block syntax highlighting.)")) +
          p(None, 
            "The custom Hyde components used to build this webserver are as follows:" +
            ul(None,
              li(None,
                span("inline-code", "App") +
                div(None, 
                  ul(None, 
                    li(None, "The main application container for the webserver.") +
                    li(None, "Thing of it like the " + span("inline-code", "app")  + " class from Flask.") +
                    li(None, "Responsible for hooking up the router and templates, then serving each via the Hyde " + span("inline-code", "BaseHttpRequestHandler") + ".")
                  )
                )
              ) +
              li(None,
                span("inline-code", "Router") +
                div(None, 
                  ul(None, 
                    li(None, "Builds up a giant " + span("inline-code", "Map") + " of route data, which it then serves on " + span("inline-code", "app.serve()") + ".") +
                    li(None, "It also includes a debug helper " + span("inline-code", "printRoutes()") + " to see what's been defined.") 
                  )
                )
              ) +
              li(None,
                span("inline-code", "HTMLGenerator") +
                div(None, 
                  ul(None, 
                    li(None, "This class loads in a global helper function for each supported HTML tag. Each function generates stringified HTML with the correct " +
                      "classes and attributes."
                    ) + 
                    li(None, "A non-exhaustive list of supported tags:" +
                      ul(None, 
                        li(None, span("inline-code", "a")) +
                        li(None, span("inline-code", "div")) +
                        li(None, span("inline-code", "h1")) +
                        li(None, span("inline-code", "h2")) +
                        li(None, span("inline-code", "i")) +
                        li(None, span("inline-code", "img")) +
                        li(None, span("inline-code", "li")) +
                        li(None, span("inline-code", "p")) +
                        li(None, span("inline-code", "span")) +
                        li(None, span("inline-code", "ul")) 
                      )
                    ) +
                    li(None, "Note the gratuitous use of " + span("inline-code", "load") + " here -- each template defines a " + span("inline-code", "_renderer") + " class " +
                      "that is responsible for rendering the content. " + span("inline-code", "load") + "ing the template inserts the renderer into the global namespace, " +
                      "where it is immediately grabbed and passed to the router. The stringified HTML from the renderer is then layered into the previously registered " +
                      span("inline-code", "applicationTemplate") + " in exactly the same way."
                    )
                  )
                )
              )
            )
          )
        )
      ) + hr +
      div("paragraph-container container",
        div(None, h2(None, "Generating HTML")) +
        div(None,
          p(None, "Okay, I'm going to show you why I named this language Hyde. Be warned: the screenshot you're about to see is not fit for small children or people with more " +
            "than two functioning brain cells."
          ) +
          img(None, "static/images/hyde_html.png") +
          p(None, "As you can " + i(None, "clearly") + " see, this is quite horrendous. Hyde has very little in the form of string manipulation functions, so this is abuse of " +
            "classes taken to the max. As mentioned before, the " + span("inline-code", "HTMLGenerator") + " class injects its functions directly into the global namespace " +
            "(because there are no modules to speak of), where the template renderers pick them up and use it to generate stringified HTML."
          ) +
          p(None, "What this means for each tag, you're effectively just calling an absolutely massive chain of global functions and concatenating their output at each level.") +
          p(None, i(None, "Frankly, this is a miracle.")) +
          p(None, "A couple of things to point out:" +
            ul(None, 
              li(None, "Note the gratuitous use of " + span("inline-code", "None") +
                ul(None,
                  li(None, "The first argument of a " + span("inline-code", "HTMLGenerator") + " tag function is the class to assign to the generated element. Hence, in a lot " +
                    "of cases, we don't need to set this." 
                  )
                )
              ) +
              li(None, span("inline-code", "+") + "'s everywhere!" +
                ul(None,
                  li(None, "Remember, we're just adding return values together til it finally culminates in the " + span("inline-code", "TemplateRenderer.html()") + " function!")
                )
              ) +
              li(None, "No return tags." + 
                ul(None,
                  li(None, "Hyde ain't no templating engine")
                )
              )
            )
          )
        )
      ) + hr +
      div("paragraph-container container",
        div(None, h2(None, "Final Thoughts")) +
        div(None,
          p(None, "Thanks for reading. It's been a challenge working on this project and I hope you've enjoyed the pain I've put myself through to make this available on " +
            "the internet. Now it's time for a beer (or several)."
          )
        )
      )
    );
  }
}
