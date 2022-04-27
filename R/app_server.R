#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  # Make the number 10
  numb <- reactive(input$a * 2)

  # use the module to make the DNA to protein.
  dna <- reactive(make_dna(numb()))
  rna <- reactive(make_rna(dna()))
  codon <- reactive(make_codon(rna()))
  protein <- reactive(make_polypeptide(codon()))
  chart <- reactive(find_aa_distribution(protein()))

  # View the outcomes
  output$oDNA <- renderText(dna())
  output$oRNA <- renderText(rna())
  output$oCodon <- renderText(codon())
  output$oProt <- renderText(protein())
  output$obar <- renderPlot(chart(), res = 96)
}
