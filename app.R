################################
# [ShinyApp: Course Work]
# by Jim Lung
################################

#
library(stringi)
library(dplyr)
library(ggplot2)
library(googleVis)
library(ggvis)
library(shiny)
library(shinydashboard)
library(RColorBrewer)
library(DT)
#library(fiftystater)

#data("fifty_states")

Sys.setlocale('LC_ALL','C') 
options(shiny.trace=F)


header <- dashboardHeader(
  title = "ePortfolio"
)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Resume", tabName = "Introduction", icon = icon("fa fa-compass")),
    menuItem("Resume in PDF", tabName = "resume_pdf", icon = icon("fa fa-compass")),
    menuItem(h4(tags$strong(style="color:green"," Work Sample :"))),
    
    menuItem(tags$strong("1. Machine learning in S&P500", icon = icon("fa fa-compass"))),
      menuSubItem("Introduction", tabName = "workSample1"),
      menuSubItem("Experiment & Result", tabName = "workSample2"),
      menuSubItem("Coding in Python", tabName = "ML1_jupyter"),
      menuSubItem("Analysis Report in PDF", tabName = "ML1_pdf"),
    
    menuItem(tags$strong("2. R shiny Dashboard", icon = icon("bar-chart-o"))),
      menuSubItem("Introduction", tabName = "myTabForIntroduction"),
      menuSubItem("Scatter Plot", tabName = "myTabForScatterPlot"),
      menuSubItem("Data Explorer", tabName = "myTabForDataTable"),
      menuSubItem("Comparison Job Title", tabName = "myTabForGvisMap"),
      menuSubItem("Coding", tabName = "rcoding"),
   
    menuItem(tags$strong("3. Other samples", icon = icon("bar-chart-o"))),
      menuSubItem("3.1 Mathematical Modeling in R", tabName = "MMT"),
      menuSubItem("3.2 Data mining in R", tabName = "DMR"),
      menuSubItem("3.3 Sentiment Analysis", tabName = "SAP"),
      menuSubItem("3.4 Machine learning", tabName = "MLF"),
      menuSubItem("3.5 Financial analysis in R", tabName = "SCV"),
    
    #menuItem("Reference Info", tabName = "myTabForExternalInfo", icon = icon("fa fa-compass")),
    tags$br(),
    menuItem(h5(tags$strong(style="color:green","This site is made by R Shiny")),
      menuSubItem("Site Code in R", tabName = "site_code")),
    tags$br(),
    tags$br()
  )
) 

body <- dashboardBody(
  
  tabItems(
    
    tabItem("Introduction",
            
            fluidRow(
              box(
                title = "Resume", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         h2(tags$strong(style="color:black","Tze Fung Jim Lung")),
                         imageOutput("myImage"),
                         tags$br(),
                         tags$br(),
                         tags$br(),
                         tags$br(),
                         tags$br(),
                         tags$span(   
                           h4(tags$strong(style="color:blue","Career Objective: ")),
                           h4(tags$li("Bilingual master graduate in data science with Intern experience in data analysis seeking a challenging position in the IT
and data analysis field where relevant expertise can be utilized")),
                           tags$br(),

                           h4(tags$strong(style="color:blue","Contact Info :")),
                           h4(tags$li(tags$a(href="https://www.linkedin.com/in/tze-fung-lung-0a9111164/", "Linkedin"))),
                           h4(tags$li(tags$a(href="mailto:fung10_91@hotmail.com", "fung10_91@hotmail.com"))),
                           tags$br(),
                           
                           
                           h4(tags$strong(style="color:blue","Skills :")),
                           h4(tags$li("Excellent working knowledge of R and Python for financial analysis and Data Science skills.")),
                           h4(tags$li("Other areas of expertise include
data scraping, data cleaning and imputation, data visualization, data mining and modeling, machine learning, Hadoop,
Mathematics and statistics programming.")),
                           h4(tags$li("Foreign language: Cantonese and Mandarin.")),
                           tags$br(),
                           
                           h4(tags$strong(style="color:blue","Education :")),
                           h4(tags$li("Master Degree of Data Science at City University of New York (CUNY) (April 2019, GPA: 3.9)")),
                           h4(tags$li("BEng in Manufacturing Informatics and Systems Engineering from City University of Hong Kong (May 2005)")),
                           tags$br(),
                            
                           h4(tags$strong(style="color:blue","Experience :")),
                           h4(tags$strong("Intern - Kasisto, New York, NY (Jan. 2019 - Apr. 2019)")),
                           h4(tags$li("Be responsible for the data sourcing pipeline and improve the natural language in chatbot")),
                           h4(tags$li("Develop and support of a wide range of data transformations and migrations")),
                           h4(tags$li("Construct custom ETL processes ")),
                           
                           h4(tags$strong("Freelance Data Analyst - Various clients (Jul. 2018 - Dec. 2018)")),
                           h4(tags$li("Provided complex and intensive data analysis related to data scraping, visualization, mining, and Excel formation and Pivot
table")),
                           h4(tags$strong("Co-Founder - Newinsock.com, New York, NY (Jan. 2017 - Jun. 2018)")),
                           h4(tags$li("Conducted sourcing for products to ensure constant and timely supply of inventory; coordinated shipping and professional
packaging for product orders; provided detailed follow-through and after sales service for customer satisfaction")),
                           h4(tags$li("Designed comprehensive web pages for business using Wordpress and SEO setting")),
                           
                           br()
                         )
                       )
                )
              )
            )
            
        
            
    ),
    
    tabItem("myTabForIntroduction",
            
            fluidRow(
              box(
                title = "Visualization Project", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         
                         tags$span(   
                           h4(tags$strong("Project Aims: ")),
                           h4(tags$li("Use of visualization to conduct visual analytics on data analysis")),
                           h4(tags$li("Provide user-friendly interface to explore the data")),
                           br()
                         )
                       )
                )
              )
            ),
            fluidRow(
              box(
                title = "About The Data Set", solidHeader = TRUE,
                status="primary", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         "The dataset is from the United States Department of Labor, Employment & Training Administration.",
                         tags$span(   
                           #tags$strong("United States Department of Labor, Employment & Training Administration. "), 
                           "It is about the prevailing wage data of foreign employers seeking to file applications in the Permanent Labor Certification Program prevailing wage data of US natives are not included.",
                           h4(tags$li("Source: https://www.foreignlaborcert.doleta.gov/performancedata.cfm")),
                           h4(tags$li("The filtered data for this application contains total 167,278 cases (in 17 columns) in 2015")),
                           br()
                         )
                       )
                )
              )
            ),
            fluidRow(
              box(
                title = "About the Application", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       # h4("This, Data Science Salary Comparator, is the shiny application designed to explore and compare salary data among 8 professions:"),
                       tags$div(
                         "This, ",
                         tags$span(      # Creates an HTML span.
                           tags$strong("Data Science Salary Comparator"), 
                           ", is the shiny dashboard application designed to explore and compare salary data among 8 professions, including:",
                           tags$li("Data Scientist"), 
                           tags$li("Software Engineer"), 
                           tags$li("Data Analyst"), 
                           tags$li("Business Analyst"), 
                           tags$li("Management Consultant"), 
                           tags$li("Assistant Professor"), 
                           tags$li("Attorney"), 
                           tags$li("Teacher! "),
                           #tags$br(),
                           "* Please note that the data is from the United States Department of Labor, Employment & Training Administration and based on the prevailing wage data of foreign employers (The prevailing wage data of US natives are not included)",
                           tags$br()
                         )
                       ),
                       br()
                )
              )
            )
            
    ),
    tabItem("myTabForScatterPlot",
            h2("Salary Data Scatter Plot"),
            
            fluidRow(
              box(
                title = "Please be patient that it usually takes 10 seconds to load the scatter plot (Toggle the + button)", solidHeader = TRUE,
                status="warning", width=12, collapsible = TRUE,  collapsed = TRUE,
                h4(tags$li("This 'Salary Scatter Plot' panel shows the salary distribution by 8 different jobs. It comprises of three sections: an option input section, a plot area section, and an aggreate summary box section.")),
                h4(tags$li("The plot area basically shows two types of visualizations: a scatter plot showing all the salary data by 8 professions, and a box plot showing values of minimum, 25 percent quintile, median, 75 percent quintile, and maximum. Users can toggle the 'showing data points' option above the plot so that they can only see the boxplot alone. Users also can interactively change the options of the target states (All or one state among 50), and target salary range. Corresponding changes are updated on the plot area and the aggregate summary boxes as soon as users made any change.")),
                h4(tags$li("Salary data of assistant professor are in red color, attroney salary are in orange color, business analyst salary are in light green color, data analyst salary are in green color, data scientist salary are in teal color , management consultant salary are in turkey blue color, software engineer salary are in purple and teacher salary are in red violet color. "))
              )
            ),
            
            fluidRow(
              column(4, 
                     selectizeInput('singleSelectForStatesForScatterPlot', 'States:', 
                                    c("All"= '', "Alabama" = "AL", "Alaska" = "AK","Arizona" = "AZ", "Arkansas" = "AR", 
                                      "California" = "CA", "Colorado" = "CO", "Connecticut" = "CT", "Delaware" = "DE", "District of Columbia" = "DC", 
                                      "Florida" = "FL", "Georgia" = "GA", "Guam" = "GU", "Hawaii" = "HI", "Idaho" = "ID", "Illinois" = "IL", 
                                      "Indiana" = "IN", "Iowa" = "IA","Kansas" = "KS", "Kentucky" = "KY", "Louisiana" = "LA", "Maine" = "ME",
                                      "Maryland" = "MD", "Massachusetts" = "MA", "Michigan" = "MI", "Minnesota" = "MN", "Mississippi" = "MS",
                                      "Missouri" = "MO", "Montana" = "MT", "Nebraska" = "NE", "Nevada" = "NV", "New Hampshire" = "NH",
                                      "New Jersey" = "NJ", "New Mexico" = "NM", "New York" = "NY","North Carolina" = "NC", "North Dakota" = "ND",
                                      "Northern Mariana Islands" = "MP", "Ohio" = "OH", "Oklahoma" = "OK", "Oregon" = "OR", "Palau" = "PW",
                                      "Pennsylvania" = "PA", "Puerto Rico" = "PR", "Rhode Island" = "RI", "South Carolina" = "SC", 
                                      "South Dakota" = "SD", "Tennessee" = "TN", "Texas" = "TX", "Utah" = "UT", "Vermont" = "VT", 
                                      "Virgin Islands" = "VI", "Virginia" = "VA", "Washington" = "WA", "West Virginia" = "WV", "Wisconsin" = "WI",
                                      "Wyoming" = "WY"),
                                    multiple = F)
              ),
              column(4, 
                     sliderInput("sliderForSalaryRangeForScatterPlot", "Salary Range:", 
                                 min = 0, max = 350000, value = c(12000, 250000), step = 5000)
              ),
              column(4, checkboxInput("checkboxForShowDataPoint", label = "Show data points", value = TRUE))
            ),
            br(),
            fluidRow( plotOutput("myQScatterChart") ), 
            #fluidRow( htmlOutput("mySummaryForScatterPlot") ) 
            #fluidRow(verbatimTextOutput("mySummaryForScatterPlot"))
            
            br(),
            fluidRow(
              # Dynamic infoBoxes
              infoBoxOutput("minBoxInScatterSummary"),
              infoBoxOutput("medBoxInScatterSummary"),
              infoBoxOutput("maxBoxInScatterSummary")
            ),
            fluidRow(
              infoBoxOutput("q1BoxInScatterSummary"),
              infoBoxOutput("meanBoxInScatterSummary"),
              infoBoxOutput("q3BoxInScatterSummary")
            ) 
    ),
    
    tabItem("myTabForDataTable",
            h2("Salary Data Explorer"),
            
            fluidRow(
              box(
                title = "How to use (Toggle the + button)", solidHeader = TRUE,
                status="warning", width=12, collapsible = TRUE, collapsed = TRUE,
                h5("This 'Salary Data Explorer' is a data table having features of filtering, paginating, searching, and sorting to explore the data of your interests. You can interactively choose the options, then the table shows updated result. The data of the table can be filtered by profession (multiple choices), state, salary range, and name (of city and employer)"),
                br()
              )
            ),
            
            fluidRow(
              column(3, checkboxInput("checkboxForDS", label = "Data Scientist", value = TRUE) ),
              column(3, checkboxInput("checkboxForSW", label = "Software Engineer", value = TRUE)),
              column(3, checkboxInput("checkboxForDA", label = "Data Analyst", value = TRUE)),
              column(3, checkboxInput("checkboxForBA", label = "Business Analyst", value = TRUE))
            ),
            fluidRow(
              column(3, checkboxInput("checkboxForAP", label = "Assistant Professor", value = TRUE)),
              column(3, checkboxInput("checkboxForMC", label = "Management Consultant", value = TRUE)),
              column(3, checkboxInput("checkboxForAT", label = "Attorney", value = TRUE)),
              column(3, checkboxInput("checkboxForTC", label = "Teacher", value = TRUE))
            ),
            fluidRow(
              column(6,
                     selectizeInput('multiSelectForStates', 'States:', 
                                    c("Choose multiple"= '', "Alabama" = "AL", "Alaska" = "AK","Arizona" = "AZ", "Arkansas" = "AR", 
                                      "California" = "CA", "Colorado" = "CO", "Connecticut" = "CT", "Delaware" = "DE", "District of Columbia" = "DC", 
                                      "Florida" = "FL", "Georgia" = "GA", "Guam" = "GU", "Hawaii" = "HI", "Idaho" = "ID", "Illinois" = "IL", 
                                      "Indiana" = "IN", "Iowa" = "IA","Kansas" = "KS", "Kentucky" = "KY", "Louisiana" = "LA", "Maine" = "ME",
                                      "Maryland" = "MD", "Massachusetts" = "MA", "Michigan" = "MI", "Minnesota" = "MN", "Mississippi" = "MS",
                                      "Missouri" = "MO", "Montana" = "MT", "Nebraska" = "NE", "Nevada" = "NV", "New Hampshire" = "NH",
                                      "New Jersey" = "NJ", "New Mexico" = "NM", "New York" = "NY","North Carolina" = "NC", "North Dakota" = "ND",
                                      "Northern Mariana Islands" = "MP", "Ohio" = "OH", "Oklahoma" = "OK", "Oregon" = "OR", "Palau" = "PW",
                                      "Pennsylvania" = "PA", "Puerto Rico" = "PR", "Rhode Island" = "RI", "South Carolina" = "SC", 
                                      "South Dakota" = "SD", "Tennessee" = "TN", "Texas" = "TX", "Utah" = "UT", "Vermont" = "VT", 
                                      "Virgin Islands" = "VI", "Virginia" = "VA", "Washington" = "WA", "West Virginia" = "WV", "Wisconsin" = "WI",
                                      "Wyoming" = "WY"),
                                    multiple = TRUE
                     )
              ),
              column(6, 
                     sliderInput("sliderForSalaryRange", "Salary Range:", 
                                 min = 0, max = 350000, value = c(12000, 250000), step = 5000)
              )
            ),
            
            fluidRow(
              column(6, textInput("searchInputForCity","City Search:","") ),
              column(6, textInput("searchInputForEmployer","Employer Name Search:",""))
            ),
            fluidRow(br()),
            fluidRow(
              DT::dataTableOutput("myTable")
            )
    ),
    
    tabItem("myTabForGvisMap",
            h2("Jobs Comparison"),
            
            fluidRow(
              box(
                title = "How to use (Toggle the + button)", solidHeader = TRUE,
                status="warning", width=12, collapsible = TRUE, collapsed = TRUE,
                h5("The Salary Comparison Map provides a way to compare salary distribution of two professions in the United States. You can choose two professions (job titles), and data table will show the updated result. You can also sort the results in the table by state, average salary and the number of jobs."),
                br(),
                h5("Note that when the panel is initialized, all the data which is not filtered yet by state, profession, average salary and the number of jobs."),
                br()
              )
            ),
            
            fluidRow(
              column(6, 
                     selectizeInput('singleSelectForJobTitleForComparison1', 'Choose the 1st Job Title:', 
                                    c("Choose one"= '', "Data Scientist" = "data scientist", "Software Engineer" = "software engineer", 
                                      "Data Analyst" = "data analyst", "Business Analyst" = "business analyst", "Assistant Professor" = "assistant professor", 
                                      "Management Consultant" = "management consultant", "Attorney" = "attorney", "Teacher" = "teacher"
                                    ),
                                    multiple = FALSE
                     )),
              column(6, 
                     selectizeInput('singleSelectForJobTitleForComparison2', 'Choose the 2nd Job Title:', 
                                    c("Choose one"= '', "Data Scientist" = "data scientist", "Software Engineer" = "software engineer", 
                                      "Data Analyst" = "data analyst", "Business Analyst" = "business analyst", "Assistant Professor" = "assistant professor", 
                                      "Management Consultant" = "management consultant", "Attorney" = "attorney", "Teacher" = "teacher"
                                    ),
                                    multiple = FALSE
                     ))
            ) , 
            ## Hosting problem with shinyapps, but it work locally, so we don't use this in this uploaded version
            #fluidRow(
            #  box(
            #    title = "Map 1", solidHeader = TRUE,
            #    collapsible = TRUE, 
            #    plotOutput("myGvisMap1") 
            #    
            #  ),
            #  box(
            #    title = "Map 2", solidHeader = TRUE,
            #    collapsible = TRUE,
            #    plotOutput("myGvisMap2") 
            #  )
            #),
            fluidRow(
              box(
                title = "DataTable 1", solidHeader = TRUE,
                collapsible = TRUE,
                DT::dataTableOutput("myComparisonTableByJobTitle1")
                
              ),
              box(
                title = "DataTable 2", solidHeader = TRUE,
                collapsible = TRUE,
                DT::dataTableOutput("myComparisonTableByJobTitle2")
              )
            )
    ),
    
    tabItem("myTabForExternalInfo",
            fluidRow(
              box(
                title = "Reference:", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         h3("Here are the links to :"),
                         h4(tags$li(tags$a(href="https://github.com/rstudio/shiny-examples", "https://github.com/rstudio/shiny-examples"))),
                         h4(tags$li(tags$a(href="http://rstudio.github.io/shinydashboard/structure.html", "http://rstudio.github.io/shinydashboard/structure.html"))),
                         h4(tags$li(tags$a(href="https://www.showmeshiny.com/", "https://www.showmeshiny.com/"))),
                         h4(tags$li(tags$a(href="https://shiny.rstudio.com/tutorial/written-tutorial/lesson2/", "https://shiny.rstudio.com/tutorial/written-tutorial/lesson2/"))),
                         tags$br()
                       )
                )
              )
            )
            
    ),
    
    tabItem("ML1_jupyter",
            fluidRow(
              box(
                title = "Python Coding:", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         h3("Here are the links to :"),
                         h4(tags$li(tags$a(href="https://nbviewer.jupyter.org/github/fung1091/Data698/blob/master/final/finalreport.ipynb", "Report in Jupyter - Python"))),
                         
                         tags$iframe(style="height:600px; width:100%; scrolling=yes", 
                                     src="https://nbviewer.jupyter.org/github/fung1091/Data698/blob/master/final/finalreport.ipynb")),
                         
                         tags$br()
                       )
                )
              )
            
            
    ),
    
    tabItem("ML1_pdf",
            fluidRow(
              box(
                title = "Analysis Report:", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         h3("Here are the links to :"),
                         h4(tags$li(tags$a(href="https://rawcdn.githack.com/fung1091/Data698/master/final/finalreport_final.pdf", "Analysis Report in PDF"))),
                         
                         tags$iframe(style="height:600px; width:100%; scrolling=yes", 
                                     src="https://rawcdn.githack.com/fung1091/Data698/master/final/finalreport_final.pdf")),
                       
                       tags$br()
                )
              )
            )
            
            
    ),
    
    tabItem("resume_pdf",
            fluidRow(
              box(
                title = "Resume in PDF:", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         h3("Here are the links to :"),
                         h4(tags$li(tags$a(href="https://rawcdn.githack.com/fung1091/profile/master/TzeFung_Jim_resume.pdf", "Resume in PDF"))),
                         
                         tags$iframe(style="height:600px; width:100%; scrolling=yes", 
                                     src="https://rawcdn.githack.com/fung1091/profile/master/TzeFung_Jim_resume.pdf")),
                       
                       tags$br()
                )
              )
            )
            
            
    ),
    
    tabItem("site_code",
            fluidRow(
              box(
                title = "R shiny code for Resume:", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         h3("Here are the links to :"),
                         h4(tags$li(tags$a(href="https://nbviewer.jupyter.org/github/fung1091/profile/blob/master/app.R", "R code for Resume"))),
                         
                         tags$iframe(style="height:600px; width:100%; scrolling=yes", 
                                     src="https://nbviewer.jupyter.org/github/fung1091/profile/blob/master/app.R")),
                       
                       tags$br()
                )
              )
            )
            
            
    ),
    
    tabItem("rcoding",
            fluidRow(
              box(
                title = "R shiny code for Dashboard:", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         h3("Here are the links to :"),
                         h4(tags$li(tags$a(href="https://nbviewer.jupyter.org/github/fung1091/data608/blob/master/Final%20Project/app.R", "R shiny code for Dashboard"))),
                         
                         tags$iframe(style="height:600px; width:100%; scrolling=yes", 
                                     src="https://nbviewer.jupyter.org/github/fung1091/data608/blob/master/Final%20Project/app.R")),
                       
                       tags$br()
                )
              )
            )
            
            
    ),
    
    tabItem("MMT",
            fluidRow(
              box(
                title = "Mathematical Modeling Techniques for Data Analytics:", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         h3("Here are the links to :"),
                         h4(tags$li(tags$a(href="http://rpubs.com/fung10_91/data609projectcode", "R code in Rpubs"))),
                         
                         tags$iframe(style="height:600px; width:100%; scrolling=yes", 
                                     src="https://rawcdn.githack.com/fung1091/data609/master/project/data609project.pdf")),
                       
                       tags$br()
                )
              )
            )
            
            
    ),
    
    tabItem("DMR",
            fluidRow(
              box(
                title = "Data Mining and Modeling for Data Analytics:", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         h3("Here are the links to :"),
                         h4(tags$li(tags$a(href="https://nbviewer.jupyter.org/github/fung1091/data621/blob/master/finalproject/data621final.Rmd", "R code"))),
                         
                         tags$iframe(style="height:600px; width:100%; scrolling=yes", 
                                     src="https://rawcdn.githack.com/fung1091/data621/master/finalproject/data621final.pdf")),
                       
                       tags$br()
                )
              )
            )
            
            
    ),
    
    tabItem("SAP",
            fluidRow(
              box(
                title = "Nasdaq Prediction by Naive Bayses Classifier and Network Analysis in Python:", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         h3("Here are the links to :"),
                         h4(tags$li(tags$a(href="https://nbviewer.jupyter.org/github/fung1091/Data620/blob/master/finalproject/miniproject.ipynb", "Report in Jupyter - Python"))),
                         
                         tags$iframe(style="height:600px; width:100%; scrolling=yes", 
                                     src="https://nbviewer.jupyter.org/github/fung1091/Data620/blob/master/finalproject/miniproject.ipynb")),
                       
                       tags$br()
                )
              )
            )
            
            
    ),
    
    tabItem("SCV",
            fluidRow(
              box(
                title = "Financial data scraping, cleaning, visualization and News sentiment Analysis in R", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         h3("Here are the links to :"),
                         h4(tags$li(tags$a(href="http://rpubs.com/fung10_91/DATA607finalproject", "R code in Rpubs")))
                         
                         #tags$iframe(style="height:600px; width:100%; scrolling=yes", 
                         #            src="https://nbviewer.jupyter.org/github/fung1091/Data620/blob/master/finalproject/miniproject.ipynb")
                         ),
                       
                       tags$br()
                )
              )
            )
            
            
    ),
    
    tabItem("MLF",
            fluidRow(
              box(
                title = "Machine learning for Finance in Jupyter - Python:", solidHeader = TRUE,
                status="success", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         h3("Here are the links to :"),
                         h4(tags$li(tags$a(href="https://nbviewer.jupyter.org/github/programminggroup/datafinalproject/blob/master/linear_regression.ipynb", "Report in Jupyter - Python"))),
                         
                         tags$iframe(style="height:600px; width:100%; scrolling=yes", 
                                     src="https://nbviewer.jupyter.org/github/programminggroup/datafinalproject/blob/master/linear_regression.ipynb")),
                       
                       tags$br()
                )
              )
            )
            
            
    ),
    
    tabItem("workSample1",
            imageOutput("myImage1"),
            fluidRow(
              box(
                title = h3("Topic: Portfolio optimization and Machine learning with visualization analysis for S&P 500 in Python"), solidHeader = TRUE,
                status="primary", width=12, collapsible = FALSE,
                column(12, 
                       tags$div(
                         #h3(tags$strong(style="color:blue","Analysis Report Link :")),
                         #h4(tags$li(tags$strong(tags$a(href="https://rawcdn.githack.com/fung1091/Data698/master/final/finalreport1.html", "Report in HTML"))),
                         #h4(tags$li(tags$strong(tags$a(href="https://nbviewer.jupyter.org/github/fung1091/Data698/blob/master/final/finalreport.ipynb", "Report with Coding in Jupyter - Python")))),
                         #h4(tags$li(tags$strong(tags$a(href="https://rawcdn.githack.com/fung1091/Data698/master/final/finalreport_final.pdf", "PDF report"))),
                         #tags$br(),
                         
                         h3(tags$strong(style="color:blue","Description :")),
                         h4("We are looking at the S&P 500, an index of the largest US companies. The S&P 500 is an American stock market index based on the market capitalization of 500 large companies having common stock listed on the NYSE, NASDAQ Exchange."),
                         h4("I loaded all 500 dataset in S&P 500 for analysis by using portfolio optimization to get the possible several stocks with higher return and lower risk. And using the machine learning predict the investment trend for S&P 500 index."),

                         h3(tags$strong(style="color:blue","Methodology :")),
                         h4("This project are separated 4 part of analysis from", tags$strong("data exploration, visualization, correlation and monthly return for data extraction by mathematical programming, portfolio optimization and machine learning"), "."),
                         tags$br(),
                         h4(tags$strong("1. Data Exploration:")),
                         h4(tags$li("To use ", tags$strong("Beautifulsoup"), "grap stocks symbol for S&P 500")),
                         h4(tags$li("To use API in the function of ", tags$strong("fix_yahoo_finance"), "to load all dataset for 500 stocks share from January 2008 until Now, each stocks symbol will be used to load their own CSV dataset file.")),
                         h4(tags$li("To select each stocks of adjusted closing price and use the ", tags$strong("join"), "function and rename the columns to create the joined CSV.")),
                         h4(tags$li("To use both ", tags$strong("plotly"), "and", tags$strong("matplotlib"),"for data visualization," , tags$strong("iplot"), "can be used to compare the detail price in certain period of time.")),
                         tags$br(),
                         h4(tags$strong("2. Higher monthly return:")),
                         h4(tags$li("To use ", tags$strong("corr() function"), "to find out the top 30 stocks which are higher correlation with S&P 500 index from 500 stocks share.")),
                         h4(tags$li("The Last part of this project will conduct the prediction of machine learning for S&P 500 index, so the correlation between stocks and index is important reference for the trend affected by index fluctuation.")),
                         h4(tags$li("To calculate and compare the higher monthly return for this 30 stocks.")),
                         h4(tags$li("To calculate the ", tags$strong("top 10 stocks of highest monthly return from the above 30"),".")),
                         tags$br(),
                         h4(tags$strong("3. Portfolio Optimization:")),
                         h4(tags$li("To use the portfolio optimization method to decide the investment strategic.")),
                         h4(tags$li("To calculate the ", tags$strong("top 10 higher monthly return"),"of stocks share as Medium or long term investment.")),
                         h4(tags$li("To calculate the ", tags$strong("top 10 higher monthly return"),"with lower risk as investment strategic.")),
                         tags$br(),
                         h4(tags$strong("4. Machine Learning:")),
                         h4("1. Moving average"),
                         h4("2. Linear Regression"),
                         h4(tags$li("Using the function of ", tags$strong("linear_model"),"in", tags$strong("sklearn"))),
                         h4("3. k-Nearest Neighbours"),
                         h4(tags$li("Using the function of ", tags$strong("neighbors, GridSearchCV, MinMaxScaler"),"in", tags$strong("sklearn"))),
                         h4("4. Auto ARIMA"),
                         h4(tags$li("Using the function of ", tags$strong("auto_arima"),"in", tags$strong("pmdarima"))),
                         h4("5. Prophet"),
                         h4(tags$li("Using the function of ", tags$strong("Prophet in fbprophet"),"which Prophet, designed by Facebook")),
                         h4("6. Long Short Term Memory"),
                         h4(tags$li("Using the function of ", tags$strong("MinMaxScaler in sklearn"),"and", tags$strong("LSTM in keras"))),
                         
                        
                         
                         tags$br()
                         
                       )
                )
              )
            )
            
    )
  ,

  tabItem("workSample2",
          fluidRow(
            box(
              title = h3("Topic: Portfolio optimization and Machine learning with visualization analysis for S&P 500 in Python"), solidHeader = TRUE,
              status="primary", width=12, collapsible = FALSE,
              column(12, 
                     tags$div(
                       #h3(tags$strong(style="color:blue","Analysis Report Link :")),
                       #h4(tags$li(tags$strong(tags$a(href="https://rawcdn.githack.com/fung1091/Data698/master/final/finalreport1.html", "Report in HTML"))),
                        #  h4(tags$li(tags$strong(tags$a(href="https://nbviewer.jupyter.org/github/fung1091/Data698/blob/master/final/finalreport.ipynb", "Report with Coding in Jupyter - Python")))),
                        #  h4(tags$li(tags$strong(tags$a(href="https://rawcdn.githack.com/fung1091/Data698/master/final/finalreport_final.pdf", "PDF report"))),
                        #     tags$br(),
                             
                                    
                             h3(tags$strong(style="color:blue","Experiment & Result :")),
                             h4("1. We considered if it plot all 500 stock shares, it can't appear a meaningful comparation graph. Initially, we view the
                                first 5 column including S&P 500 index in the time series from 2008 to 2019 (2019-04-18)."),
                             h4("We will further see the top 10
                                monthly return, top 10 for higher correlation with S&P 500 index, and top 10 investing stocks strategic from the
                                portfolio optimization in our data time series."),
                             imageOutput("myImage2"),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             
                             h4("2. Does it have strong relation with S&P 500 index fluctation when we invest some stocks?"),
                             h4("Most people think that they will get higher return when the main index going up, so we can calculate the
                                correlation to check which stocks share are strong relationship and low relationship."),
                             imageOutput("myImage3"),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             
                             h4("3. To use corr() function to find out the top 30 stocks which are higher correlation with S&P 500 index from 500
                                stocks share."),
                             imageOutput("myImage4"),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             
                             h4("5. To use lambda function to sort out the highest monthly return (top 10 from 30 stocks share which are higher correlation with S&P 500 index from 500
                                stocks share."),
                             imageOutput("myImage5"),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             h5("Until 2019-04-18, top 10 higher monthly return with higher correlation include Gartner Inc, Sherwin-Williams, 
                                Home Depot, The Cooper Companies, Roper Technologies, SBA Communications, Moody's Corp, Amphenol Corp, Fidelity National Information Services
                                Costco Wholesale Corp."), 
                             tags$br(),
                             
                             h4("6. For minimum risk portfolio, we can see around 30% of our budget is allocated to Costco. 
                                If you take another look at the daily return plot from earlier, the Costco is the least volatile among these stocks, 
                                so allocating a large percentage to Costco for minimum risk portfolio makes sense."),
                             h4("If we are willing to take higher risk for higher return, one that gives us the best risk-adjusted return is the one with maximum Sharpe ratio."),
                             imageOutput("myImage6"),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             
                             h4("7. The stock with the least risk is COST at around 0.22, 
                                but the return is only around 0.16. If we will to take slightly more risk around 0.225 return, 
                                we should consider to choose HD and SHW rather than IT with higher risk with portfolio optimisation."),
                             imageOutput("myImage7"),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             tags$br(),
                             
                             h4(tags$strong("8. Machine Learning - Moving Average")),
                             h4("The root mean square error is 556.7202, prediction is 2092.7282"),
                             imageOutput("myImage8"),
                             h4("The RMSE value is close to 556.7202646158338 but the results are not very promising."),
                             tags$br(),
                             
                             h4(tags$strong("9. Machine Learning - Linear Regression")),
                             h4("The root mean square error is 296.1361, prediction is 2525.14814"),
                             imageOutput("myImage9"),
                             h4("The RMSE value is lower than the Moving Average, which clearly shows that linear regression has performed better."),
                             tags$br(),
                             
                             h4(tags$strong("10. Machine Learning - k-Nearest Neighbours")),
                             h4("The root mean square error is 1142.9905, prediction is 2266.327"),
                             imageOutput("myImage10"),
                             h4("The RMSE value of KNN is higher than the linear regression model and the plot shows the same pattern."),
                             tags$br(),
                             
                             h4(tags$strong("11. Machine Learning - Auto ARIMA")),
                             h4("The root mean square error is 149.4734, prediction is 3098.4159"),
                             imageOutput("myImage11"),
                             h4("Although the predictions using this technique are far better than that of the previously implemented machine learning models, 
                            these predictions are still not close to the real values."),
                             tags$br(),
                             
                             h4(tags$strong("12. Machine Learning - Prophet")),
                             h4("The root mean square error is 446.4384233932304, prediction is 2285.3302"),
                             imageOutput("myImage12"),
                             h4("Forecasting techniques like ARIMA, SARIMA and Prophet would not show good results for this particular problem."),
                             tags$br(),
                             
                             h4(tags$strong("13. Machine Learning - Long Short Term Memory (LSTM)")),
                             h4("The root mean square error is 36.8895, prediction is 2899.4375"),
                             imageOutput("myImage13"),
                             h4("The model seem to predict well with real data, but it is not enough to identify whether the stock price will increase or decrease. Stock price is affected by the news about the company and other factors like demonetization or merger/demerger of the companies."),
                             tags$br(),
                             
                             h4(tags$strong("14. Model Comparsion")),
                             h4("The S&P 500 index is 2905.030029 on 2019-04-18"),
                             imageOutput("myImage14"),
                             h4("To compare with the root mean square of error, the most lowest rmse of model is by using of Long Short Term Memory method, and the prediction value is 2899.4375 As we mentioned as last part, 
                            we should also consider the news about the company and other factors like demonetization or merger/demerger of the companies."),
                             tags$br(),
                             
                             tags$br()
                             
                             )
                             )
                             )
                             )
              
              )
  ))
    
#)) 



#data("fifty_states")
#fifty_states <- data("fifty_states")


fifty_states <- read.csv("https://raw.githubusercontent.com/fung1091/data608/master/Final%20Project/fifty_states.csv")


githubURL <- "https://github.com/fung1091/data608/raw/master/Final%20Project/proposal/salary.rdata"
load(url(githubURL))
salary_refined <- x
#salary_refined <- read.csv("salary_refined.csv")

server <- function(input, output) { 
  
  options("scipen"=10) 
  
  ##########################################################
  # Data manipulation (for Salary DataTable)
  ###########################################################
  updateInputDataForDTable <- reactive({  
    
    dataFilteredForDTable <- salary_refined
    
    #dataTmp <- dataFilteredForDTable[1:500, ]
    #dataTmp <- dataTmp %>% group_by(JOB_TITLE_SUBGROUP)
    
    if(input$checkboxForDS != T){
      dataFilteredForDTable <- dataFilteredForDTable[(dataFilteredForDTable$JOB_TITLE_SUBGROUP != "data scientist"),]        
    } 
    if(input$checkboxForSW != T){
      dataFilteredForDTable <- dataFilteredForDTable[(dataFilteredForDTable$JOB_TITLE_SUBGROUP != "software engineer"),]        
    } 
    if(input$checkboxForDA != T){
      dataFilteredForDTable <- dataFilteredForDTable[(dataFilteredForDTable$JOB_TITLE_SUBGROUP != "data analyst"),]        
    } 
    if(input$checkboxForBA != T){
      dataFilteredForDTable <- dataFilteredForDTable[(dataFilteredForDTable$JOB_TITLE_SUBGROUP != "business analyst"),]        
    } 
    if(input$checkboxForAP != T){
      dataFilteredForDTable <- dataFilteredForDTable[(dataFilteredForDTable$JOB_TITLE_SUBGROUP != "assistant professor"),]        
    } 
    if(input$checkboxForMC != T){
      dataFilteredForDTable <- dataFilteredForDTable[(dataFilteredForDTable$JOB_TITLE_SUBGROUP != "management consultant"),]        
    } 
    if(input$checkboxForAT != T){
      dataFilteredForDTable <- dataFilteredForDTable[(dataFilteredForDTable$JOB_TITLE_SUBGROUP != "attorney"),]        
    } 
    if(input$checkboxForTC != T){
      dataFilteredForDTable <- dataFilteredForDTable[(dataFilteredForDTable$JOB_TITLE_SUBGROUP != "teacher"),]        
    } 
    
    # Filter by States (with Multiple Selectize)
    # (AND operations. --> Ex) find 'business' in CA and GA having avg.ratings of 3.5)
    
    if(!is.null(input$multiSelectForStates) ){
      targetStates <- unlist(strsplit(input$multiSelectForStates," "))
      dataFilteredForDTable <- dataFilteredForDTable %>% filter(WORK_STATE_ABBREVIATION %in% targetStates)
    }
    
    # Filter by City
    
    if(input$searchInputForCity != ""){
      dataFilteredForDTable <- dataFilteredForDTable %>% 
        filter(grepl(input$searchInputForCity,dataFilteredForDTable$WORK_CITY, ignore.case = TRUE)) 
    }
    
    # Filter by Employer (with Search Term)
    
    if(input$searchInputForEmployer != ""){
      dataFilteredForDTable <- dataFilteredForDTable %>% 
        filter(grepl(input$searchInputForEmployer, dataFilteredForDTable$EMPLOYER_NAME, ignore.case = TRUE)) 
    }
    
    dataFilteredForDTable
  })
  
  
  ##########################################################
  # Data manipulation (for Salary Scatter Plot)
  ###########################################################
  updateInputDataForScatterPlot <- reactive({  
    dataFilteredForScatterPlot <- salary_refined
    dataFilteredForScatterPlot <- dataFilteredForScatterPlot %>% group_by(JOB_TITLE_SUBGROUP) 
    
    dataFilteredForScatterPlot <- dataFilteredForScatterPlot[(input$sliderForSalaryRangeForScatterPlot[1] <= dataFilteredForScatterPlot$PAID_WAGE_PER_YEAR &
                                                                dataFilteredForScatterPlot$PAID_WAGE_PER_YEAR <= input$sliderForSalaryRangeForScatterPlot[2]),]
    
    if(input$singleSelectForStatesForScatterPlot != ""){
      dataFilteredForScatterPlot <<- dataFilteredForScatterPlot[(input$singleSelectForStatesForScatterPlot == dataFilteredForScatterPlot$WORK_STATE_ABBREVIATION),]
    }
    
    dataFilteredForScatterPlot <<- dataFilteredForScatterPlot %>% mutate(JOB_GROUP_CODE = ifelse(JOB_TITLE_SUBGROUP == "assistant professor", 1,
                                                                                                 ifelse(JOB_TITLE_SUBGROUP == "attorney", 2,
                                                                                                        ifelse(JOB_TITLE_SUBGROUP == "business analyst", 3,
                                                                                                               ifelse(JOB_TITLE_SUBGROUP == "data analyst", 4,
                                                                                                                      ifelse(JOB_TITLE_SUBGROUP == "data scientist", 5,
                                                                                                                             ifelse(JOB_TITLE_SUBGROUP == "management consultant", 6,
                                                                                                                                    ifelse(JOB_TITLE_SUBGROUP == "software engineer", 7,
                                                                                                                                           ifelse(JOB_TITLE_SUBGROUP == "teacher", 8)))))))))
    
    
    manualQuartile <- function(x) {
      x <- sort(x)
      n <- length(x)
      m <- (n+1)/2
      if (floor(m) != m) { l <- m-1/2; u <- m+1/2
      } else { l <- m-1; u <- m+1 }
      c(Min=min(x), Q1=median(x[1:l]), Median = median(x[1:n]), Mean=mean(x), Q3=median(x[u:n]), Max=max(x))
    }
    res_mq <<- manualQuartile(dataFilteredForScatterPlot$PAID_WAGE_PER_YEAR)
    #cat(res_mq['Min']) # Print --> 10504
    #res_mq['Min'] # Print --> Min 10504 
    
    
    output$minBoxInScatterSummary <- renderInfoBox({
      infoBox( "MIN:", res_mq['Min'], icon = icon("fa fa-exclamation-circle"), color = "blue" ) })
    
    output$meanBoxInScatterSummary <- renderInfoBox({
      infoBox( "MEAN:", res_mq['Median'], icon = icon("fa fa-info-circle"), color = "teal" ) })
    
    output$maxBoxInScatterSummary <- renderInfoBox({ 
      infoBox( "MAX:", res_mq['Max'], icon = icon("fa fa-exclamation-circle"), color = "aqua" ) })
    
    output$q1BoxInScatterSummary <- renderInfoBox({
      infoBox( "Q1:", res_mq['Q1'], icon = icon("fa fa-exclamation-circle"), color = "blue" ) })
    
    output$medBoxInScatterSummary <- renderInfoBox({
      infoBox( "MEDIAN:", res_mq['Median'], icon = icon("fa fa-info-circle"), color = "teal" ) })
    
    output$q3BoxInScatterSummary <- renderInfoBox({
      infoBox( "Q3:", res_mq['Q3'], icon = icon("fa fa-exclamation-circle"), color = "aqua" ) })
    
    
    dataFilteredForScatterPlot
  })
  
  
  ##########################################################
  # Data manipulation (for Salary Comparison Maps)
  ###########################################################
  
  #////////////////////////////////////////////////////////////////////////////////
  # For Avg.Overall Salary (NOT used) ex. Avg.salary of each state.. 
  #////////////////////////////////////////////////////////////////////////////////
  updateInputDataForMapOverall <- reactive({  
    dataFilteredForMap <- salary_refined
    dataFilteredForMap <- dataFilteredForMap %>% group_by(WORK_STATE) %>% summarise(AVG_SALARY= round(mean(PAID_WAGE_PER_YEAR), 2))
    dataFilteredForMap
    
  })
  
  
  updateInputDataForMapByJobTitle1 <- reactive({  
    dataFilteredForMapByJobTitle1 <- salary_refined
    dataFilteredForMapByJobTitle1 <- dataFilteredForMapByJobTitle1 %>% mutate(WORK_STATE = tolower(WORK_STATE))
    dataFilteredForMapByJobTitle1 <- dataFilteredForMapByJobTitle1 %>% group_by(WORK_STATE, JOB_TITLE_SUBGROUP) %>% summarise(AVG_SALARY= round(mean(PAID_WAGE_PER_YEAR), 2), NUM_POS = n())
    
    if(input$singleSelectForJobTitleForComparison1 != ""){
      dataFilteredForMapByJobTitle1 <- dataFilteredForMapByJobTitle1[(input$singleSelectForJobTitleForComparison1 == dataFilteredForMapByJobTitle1$JOB_TITLE_SUBGROUP),]
    }
    
    dataFilteredForMapByJobTitle1
  })
  
  updateInputDataForMapByJobTitle2 <- reactive({  
    dataFilteredForMapByJobTitle2 <- salary_refined
    dataFilteredForMapByJobTitle2 <- dataFilteredForMapByJobTitle2 %>% mutate(WORK_STATE = tolower(WORK_STATE))
    dataFilteredForMapByJobTitle2 <- dataFilteredForMapByJobTitle2 %>% group_by(WORK_STATE, JOB_TITLE_SUBGROUP) %>% summarise(AVG_SALARY= round(mean(PAID_WAGE_PER_YEAR), 2), NUM_POS = n())
    
    if(input$singleSelectForJobTitleForComparison2 != ""){
      dataFilteredForMapByJobTitle2 <- dataFilteredForMapByJobTitle2[(input$singleSelectForJobTitleForComparison2 == dataFilteredForMapByJobTitle2$JOB_TITLE_SUBGROUP),]
    } 
    
    dataFilteredForMapByJobTitle2
  })
  
  
  
  
  ####################################################################################################################
  # Rendering Section
  #####################################################################################################################
  
  # Data Table section
  
  output$myTable <- DT::renderDataTable(DT::datatable({ 
    dataForDTable <- updateInputDataForDTable()
    #dataForDTable <- dataForDTable[, c(1,2,4,5,7,9,11:17)]
    # colnames(dataForDTable) <- c("JOB_TITLE_GROUP","JOB_TITLE","EMPLOYER", "WAGE_YEARLY", "CITY", "STATE", 
    #                          "FULLTIME?", "REQ_EXPERIENCE?", "REQ_EXP_MONTH", "REQ_EDU_LEVEL", "REQ_UNIV_MAJOR?", "VISA", "COUNTRY_OF_CITIZENSHIP")
    dataForDTable <- dataForDTable[, c(1,2,4,5,7,9)]
    colnames(dataForDTable) <- c("JOB_TITLE_GROUP","JOB_TITLE","EMPLOYER", "WAGE_YEARLY", "CITY", "STATE")
    
    dataForDTable
    
  }, rownames = FALSE, extensions = c('ColReorder','Scroller'), options = list(
    deferRender = TRUE,  
    searching = F,
    dom = 'RC<"clear">lfrtip',
    #colVis = list(activate = 'mouseover'),
    lengthMenu = list(c(10, 5, 15, 25, 25, 50, 100), c('10', '5', '15', '20', '25','50','100')),
    initComplete = JS(
      "function(settings, json) {",
      "$(this.api().table().header()).css({'background-color': '#cce6ff', 'color': '#2a4e6c'});",
      "}")
  ) 
  ) %>% formatCurrency(c('WAGE_YEARLY'), "$") ) 
  
  
  #////////////////////////////////////////////////////////////////////////////////
  # RenderPlot Map , because the orinally data doesn't have long and lat, so we need use library (fifty_states)
  # But it found the hoisting problem between local and on shinyapps, it will not be used.
  #////////////////////////////////////////////////////////////////////////////////
  output$myGvisMap1 <- renderPlot({
    
    mapData <- updateInputDataForMapByJobTitle1() # View(mapData)
    
    mapData$AVG_SALARY<-round(mapData$AVG_SALARY)
    mapData$WORK_STATE <- as.character(mapData$WORK_STATE)
    mapData <- mapData[order(as.numeric(-mapData$AVG_SALARY)),]
    
    ggplot(mapData, aes(map_id = mapData$WORK_STATE)) + 
      # map points to the fifty_states shape data
      geom_map(aes(fill = AVG_SALARY), map = fifty_states) + 
      expand_limits(x = fifty_states$long, y = fifty_states$lat) +
      coord_map() +
      scale_x_continuous(breaks = NULL) + 
      scale_y_continuous(breaks = NULL) +
      aes(fill2 = WORK_STATE) + 
      theme(legend.position = "right")
    
  },height = 400,width = 600)  
  
  
  output$myGvisMap2 <- renderPlot({
    
    mapData <- updateInputDataForMapByJobTitle2() # View(mapData)
    
    mapData$AVG_SALARY<-round(mapData$AVG_SALARY)
    mapData$WORK_STATE <- as.character(mapData$WORK_STATE)
    mapData <- mapData[order(as.numeric(-mapData$AVG_SALARY)),]
    
    ggplot(mapData, aes(map_id = mapData$WORK_STATE)) + 
      # map points to the fifty_states shape data
      geom_map(aes(fill = AVG_SALARY), map = fifty_states) + 
      expand_limits(x = fifty_states$long, y = fifty_states$lat) +
      coord_map() +
      scale_x_continuous(breaks = NULL) + 
      scale_y_continuous(breaks = NULL) +
      aes(fill2 = WORK_STATE) + 
      theme(legend.position = "right")
    
  },height = 400,width = 600) 
  
  
  
  #////////////////////////////////////////////////////////////////////////////////
  # DataTables for googleVis Map 
  #////////////////////////////////////////////////////////////////////////////////
  output$myComparisonTableByJobTitle1 <- DT::renderDataTable(DT::datatable({ 
    
    dataForDTable1 <- updateInputDataForMapByJobTitle1()
    colnames(dataForDTable1) <- c("STATE","JOB_TITLE","AVG_SALARY", "JOBS") 
    dataForDTable1
    
  }, rownames = FALSE, extensions = c('ColReorder','Scroller'), options = list(
    deferRender = TRUE,  
    searching = T,
    order = list(list(2, 'desc'), list(3, 'desc')),
    dom = 'RC<"clear">lfrtip',
    #colVis = list(activate = 'mouseover'),
    lengthMenu = list(c(10, 5, 15, 25, 25, 50, 100), c('10', '5', '15', '20', '25','50','100')),
    initComplete = JS(
      "function(settings, json) {",
      "$(this.api().table().header()).css({'background-color': '#cce6ff', 'color': '#2a4e6c'});",
      "}")
  )) %>% formatCurrency(c('AVG_SALARY'), "$") ) 
  
  
  output$myComparisonTableByJobTitle2 <- DT::renderDataTable(DT::datatable({ 
    
    dataForDTable2 <- updateInputDataForMapByJobTitle2()
    colnames(dataForDTable2) <- c("STATE","JOB_TITLE","AVG_SALARY", "JOBS") 
    dataForDTable2
    
  }, rownames = FALSE, extensions = c('ColReorder','Scroller'), options = list(
    deferRender = TRUE,  
    searching = T,
    order = list(list(2, 'desc'), list(3, 'desc')),
    dom = 'RC<"clear">lfrtip',
    #colVis = list(activate = 'mouseover'),
    lengthMenu = list(c(10, 5, 15, 25, 25, 50, 100), c('10', '5', '15', '20', '25','50','100')),
    initComplete = JS(
      "function(settings, json) {",
      "$(this.api().table().header()).css({'background-color': '#cce6ff', 'color': '#2a4e6c'});",
      "}")
  )) %>% formatCurrency(c('AVG_SALARY'), "$") ) 
  
  
  #////////////////////////////////////////////////////////////////////////////////
  # ScatterPlot (qplot)
  #////////////////////////////////////////////////////////////////////////////////
  output$myQScatterChart <- renderPlot({
    
    dataForScatterPlot <- updateInputDataForScatterPlot()
    
    if(input$checkboxForShowDataPoint == T){
      qplot(JOB_TITLE_SUBGROUP, PAID_WAGE_PER_YEAR, data=dataForScatterPlot, geom="boxplot", group = JOB_TITLE_SUBGROUP, color=JOB_TITLE_SUBGROUP) + 
        labs(title = "Total review counts by the salary") + 
        geom_jitter(position=position_jitter(width=.9), size=1, alpha=.3) +  
        theme(legend.position="none")  
    } else{
      qplot(JOB_TITLE_SUBGROUP, PAID_WAGE_PER_YEAR, data=dataForScatterPlot, geom="boxplot", group = JOB_TITLE_SUBGROUP, color=JOB_TITLE_SUBGROUP) + 
        labs(title = "Total review counts by the salary") + 
        theme(legend.position="none")
    }
  })
  
  #////////////////////////////////////////////////////////////////////////////////
  # images
  #////////////////////////////////////////////////////////////////////////////////
  # /fung1091/Data698/blob/master/output_85_3.png
  
  output$myImage <- renderImage({
    list(src = "me.JPG",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 500,
         height = 499,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage1 <- renderImage({
    list(src = "python1/top4.jpg",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 952,
         height = 358,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage2 <- renderImage({
    list(src = "python1/3_visualization_time_series.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 800,
         height = 479,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage3 <- renderImage({
    list(src = "python1/4_correlation_500.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 800,
         height = 500,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage4 <- renderImage({
    list(src = "python1/5_correlation_30top.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 800,
         height = 500,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage5 <- renderImage({
    list(src = "python1/7_top10_highMonthlyReturn.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 800,
         height = 700,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage6 <- renderImage({
    list(src = "python1/8_portfolio_allocation.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 800,
         height = 500,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage7 <- renderImage({
    list(src = "python1/9_portfolio_optimization.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 800,
         height = 800,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage8 <- renderImage({
    list(src = "python1/10_moving_average.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 800,
         height = 350,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage9 <- renderImage({
    list(src = "python1/11_linear_regression.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 800,
         height = 350,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage10 <- renderImage({
    list(src = "python1/12_KNN.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 800,
         height = 350,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage11 <- renderImage({
    list(src = "python1/13_ARIMA.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 800,
         height = 350,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage12 <- renderImage({
    list(src = "python1/14_Prophet.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 800,
         height = 350,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage13 <- renderImage({
    list(src = "python1/15_LSTM.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 800,
         height = 350,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
  output$myImage14 <- renderImage({
    list(src = "python1/16_prediction.png",
         #contentType = 'image/png',
         #width = '100%',
         #height = '100%',
         width = 375,
         height = 267,
         alt = "This is image alternate text")
  }, deleteFile = FALSE)
  
}

##########################################################
# ShinyApp main function
###########################################################
ui = dashboardPage(header, sidebar, body, skin = "black")
shinyApp(ui, server)

# shinyApp(
#   ui = dashboardPage(header, sidebar, body, skin = "black"), # skin in c(???blue???, ???black???, ???purple???, ???green???, ???red???, ???yellow???)
#   server <- server
# )

# Fpr 
# app = shinyApp(
#   ui = dashboardPage(header, sidebar, body, skin = "black"),
#   server <- server
# )
# runApp(app, host = '0.0.0.0', port = 3168)