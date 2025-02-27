# Filter data
# uiOutput coded in server.R
#~~~~~~~~~~~~~~~~~
#
function() {
  tabPanel("2. Filtered Data"
           #, fluidPage(

             , sidebarLayout(
                 sidebarPanel(width = 3,
                   # App Steps
                   #h3("App Steps")
                    h3("2. Filter Data")
                    , fluidRow(column(1)
                               , column(1, bsButton("but_filt_apply"
                                                    , "Apply Filters"))
                               # bsPopover("but_filt_apply"
                               #           , "Click 'apply' after modifying filters"
                               #           , "Only filters with items selected will be applied. Note: At least one station must be selected."
                               #           , placement = "top"
                               #           , trigger = "hover"
                               #           , options = list(container = "body"))
                               , bsPopover(id = "but_filt_apply"
                                           , title = "Apply Filters"
                                          , content = "Click 'apply' after modifying filters", "Only filters with items selected will be applied. Note: At least one station must be selected.")
                                #)##fluidRow~filter button~END
                   
                   )##fluidRow~END
                   , br()
                   , fluidRow(column(1)
                              , column(1, bsButton("but_ClearFilters"
                                                   , label="Reset Filter Selections"
                                                   , style="primary")))
                    
                    
                   , br()
                   , p("")
                   , fluidRow(h4("Filters", uiOutput("filt_collapse")))
                   
                 # , br()
                 # , fluidRow(column(1), 
                 #          column(1,bsButton("but_ClearFilters"
                 #                   , label="Reset Filter Selections"
                 #                   , style="primary"))
                 #          )##fluidRow~END
                   
                )##sidebarPanel~END
                , mainPanel(
                  tabsetPanel(type="tabs"
                              , tabPanel("Filtered Data Summary"
                                         , br()
                                         , p("The number of unique entries by station are in the table below. Modify filters and click 'Apply Filters' if value is greater than one.")
                                         , p("For 'final' files, the only field that requires filtering is 'Map Layer'.")
                                         , p("For 'user-created' files, you may need to filter by 'Parameter', 'GAM', 'Layer', 'Period', and 'Season'.")
                                         , hr()
                                         , textOutput("filt_dups_num")
                                         , hr()
                                         , DT::dataTableOutput("df_filt_dups_DT")
                                         )##tabPanel~Data Filter Summary ~ END
                              ,tabPanel("Filtered Data"
                                        #, p(paste0("Number of records imported (n=", -999 ,") and after filters applied (n=", -999, ")."))
                                        # , renderText("txt_nrow_df_import")
                                        # , p("Once have target turn green or something.")
                                        # , p("At this point no 'save' or 'load' feature for the filters".)
                                        # , p("need to modify for 'user-supplied' variables.")
                                        # , DT::dataTableOutput('df_import_DT')
                                        , DT::dataTableOutput('df_filt_DT')
                                        #, DT::dataTableOutput('df_import_DT')
                                        )##tabPanel~Data~END
                              ,tabPanel("Range Map"
                                        , tab_Plot_Range()
                                        )##tabPanel~Range~END
                              ,tabPanel("Change Map"
                                        , tab_Plot_Change()
                                        )##tabPanel~Trends~END
                  )##tabsetPanel~END
                )##mainPanel~END
                
                
             )##sidebarLayout~END
             
          # )##fluidPage~END
  )##tabPanel~END
  
}##FUNCTION~END