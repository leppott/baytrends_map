# Create a map based on user selections
# uiOutput coded in server.R
#~~~~~~~~~~~~~~~~~
#
function(){
  tabPanel("3.a. Plot Range"
           , fluidPage(h2("Plot Data Range")
          , br()
          #, p(paste0("abc", nrow_df_import(), "xyz"))
          
          , sidebarLayout(
            sidebarPanel(width=3, 
                         # App Steps
                         #h3("App Steps")
                         h3("Range Map Options")
                         , fluidRow(column(1)
                                    , column(1, bsButton("but_map_range"
                                                       , "Update Range Map"))
                                    , bsPopover("but_map_range"
                                              , "Click 'apply' after modifying filters"
                                              , "A 'data range' map will be created with the selected options."
                                              , "top"
                                              , trigger = "hover"
                                              , options = list(container = "body"))
                         )##fluidRow~filter button~END
                         , br()
                         , p("Must 'update' map prior to save.")
                         , useShinyjs()
                         , fluidRow(column(1),
                                    column(1
                                           , shinyjs::disabled(downloadButton("but_map_range_save"
                                                            , "Save Range Map")))
                                    , bsPopover("but_map_range_save"
                                              , "Click 'save' after updating map"
                                              , "A 'data range' map will be saved in the selected format."
                                              , "top"
                                              , trigger = "hover"
                                              , options = list(container = "body"))
                         )##fluidRow~save button~END
                         , br()
                         , bsCollapse(multiple = TRUE
                                      , bsCollapsePanel("Variable to Plot"
                                                        , style='info'
                                                        , uiOutput('opt_var')
                                                      )##bsCollapsePanel~variable~END
                                      , bsCollapsePanel("Class Interval"
                                                        , style='info'
                                                        , uiOutput('opt_classInt')
                                                        )##bsCollapsePanel~classInt~END
                                      , bsCollapsePanel("Color Brewer Palette"
                                                        , style='info'
                                                        , uiOutput('opt_pal')
                                                        )##bsCollapsePanel~pal~END
                                      , bsCollapsePanel("File Save Extension"
                                                        , style='info'
                                                        , uiOutput('opt_ext')
                                                        )##bsCollapsePanel~ext~END
                                      , bsCollapsePanel("River Names (Y/N)"
                                                        , style='info'
                                                        , uiOutput('opt_riverNames')
                                                        )##bsCollapsePanel~riverNames~END
                                      # , open = "Variable to Plot" # to auto open panels
                                      , open = "File Save Extension" # to auto open panels
                                      )##bsCollapse~END
                         , fluidRow(column(1), 
                                    # column(1, bsButton("but_mr_title", "Auto-generate Title")),
                                    # bsPopover("but_mr_title", "Click to auto-generate title from 'filters'."))
                                     column(1
                                            , tipify(bsButton("but_mr_title"
                                                              , "Auto-generate Title")
                                            , "Click to auto-generate title from 'filters'.")))
                         , textAreaInput("map_range_title"
                                         , "Title: "
                                     # , value = paste0("Parameter: "
                                     #                  , "; GAM: "
                                     #                  , "; Layer: "
                                     #                  , "; Season: "
                                     #                  , "; Period: ")
                                     , value = NULL #output$str_mr_title
                                     , rows = 4
                                     )##textInput~END
                         , sliderInput("numclass"
                                       , "Number of classes"
                                       , min = 3
                                       , max = 8
                                       , value = 5)
                         , p("Custom classes/breaks can be input below.  
                             Leave blank to use number of classes as specified above.
                             Need one more number than the number of intended classes.")
                         , textAreaInput("breaks", "Custom classes (comma delimited): "
                                         , value = NULL
                                         , rows = 2)##textAreaInput~END
                         , br()
                         , bsCollapse(multiple = TRUE
                                      , bsCollapsePanel("Zoom Region"
                                                        , style='info'
                                                        , uiOutput('opt_zoomregion_r')
                                      )##bsCollapsePanel~zoomregion~END
                         )##bsCollapse~END
                         , numericInput("map_range_val_zoom"
                                        , h4(paste0("  Zoom buffer (decimal degrees):"))
                                        , value = 0.05
                                        , min = 0.01
                                        , max = 2.5
                                        , step = 0.01)
                         , selectInput("colors", "Color Scheme",
                                       rownames(subset(brewer.pal.info
                                                       , category %in% c("seq", "div"))))

                         # , hr()
                         # , p("Must 'update' map prior to save.")
                         # , fluidRow(column(1),
                         #            column(1, downloadButton("but_map_range_save", "Save Range Map")),
                         #            bsPopover("but_map_range_save", "Click 'save' after updating map", "A 'data range' map will be saved in the selected format.",
                         #                      "top", trigger = "hover", options = list(container = "body"))
                         # )##fluidRow~save button~END
                         # , br() 
            )##sidebarPanel~END
            #, mainPanel(plotlyOutput("map_r_render", height = 800,  width=800/1.5)
            , mainPanel(
              tabsetPanel(type = "tabs"
                          , tabPanel("Interactive"
                                     , leafletOutput("map_r_leaflet"
                                                     , height = "85vh"))
                          , tabPanel("Static"
                                     , plotOutput("map_r_render"
                                                  , height = 800
                                                  , width = 800/1.5))
                          
                          )##tabsetPanel ~ END
                        )##mainPanel~END
            
          )##sidebarLayout~END
          
             
           )##fluidPage~END
  )##tabPanel~END
  
}##FUNCTION~END