#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(
      h1("ShinyMolBio"),
      p("Choose a number to represent the quantity of nucleotides in a simulated DNA sequence", class = "my-class1"),

      # create an slider asking for a number
      sliderInput("a", "Move the slider to enter a number: ", value = 50, min = 0, max = 100),

      # ----------------------------------------------
      textOutput("a"),
      textOutput("b"),
      textOutput("c"),

      p("The DNA sequence: ", class = "my-class2"),
      verbatimTextOutput("oDNA"),
      p("The RNA sequence: ", class = "my-class3"),
      verbatimTextOutput("oRNA"),
      p("The Codon sequence: ", class = "my-class4"),
      verbatimTextOutput("oCodon"),
      p("The Polypeptide sequence: ", class = "my-class5"),
      verbatimTextOutput("oProt"),
      p("The Distribution of Amino Acids: ", class = "my-class6"),
      plotOutput("obar"),
      p("", class = "my-class6"),
      p("The Shiny MolBio App outlines the Central Dogma of Molecular Biology", class = "my-class8"),
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "ShinyMolBio"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
