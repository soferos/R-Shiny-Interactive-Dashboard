
shinyUI(navbarPage(
    
    title = "Factors impacting on different types of chest pain",
    theme = "styles.css",
    tabPanel(title = "Home",
             img(
                 src = "chest",
                 width = '80%'
             ),
             h1(
                 "What causes different types of chest pain? Use this chart builder to find out."
             ),
             p(
                "To access the chart builder choose 'Dashboard' at the top of this page.
                From there you will be able to choose a variable from a dropdown list to see
                 how it relates to different types of chest pain. You can choose to group the data points by another variable by ticking the
                 'Enable grouping?' checkbox and choosing the grouping variable from a drop down
                 list. If you'd like to see the original data you can tick the checkbox marked as 
                 'Show underlying data?:' Since the variables are coded, below is a list explaining each
                 of them. I hope you find this tool useful, enjoy!"
             ),
             tags$ul(
                 tags$li("age: age in years"),
                 tags$li("sex: 1 = male, 0 = female"),
                 tags$li("trestbps: resting blood pressure"),
                 tags$li("chol: serum cholesterol in mg/dl"),
                 tags$li("fbs: fasting blood sugar > 120 mg/dl"),
                 tags$li("restecg: resting electrocardiographic results"),
                 tags$li("thalach: maximum heart rate achieved"),
                 tags$li("exang: exercise induced angina (1 = yes, 0 = no)"),
                 tags$li("oldpeak: ST depression induced by exercise relative to rest"),
                 tags$li("slope: the slope of the peak exercise ST segment"),
                 tags$li("ca: number of major vessels (0-3) colored by fluoroscopy"),
                 tags$li("thal: 3 = normal; 6 = fixed defect; 7 = reversable defect")
             )),
    tabPanel(title = "Dashboard", 
    sidebarLayout(
        sidebarPanel(
            varSelectInput(
                "x_axis",
                "Choose a column from the data:",
                data = heart
            ), 
            checkboxInput(
                "wants_group",
                "Enable grouping?:",
                value = F
            ),
            varSelectInput(
                "group_col",
                "Choose a column to group on:",
                data = heart
            ),
            checkboxInput(
                "wants_table",
                "Show underlying data?:",
                value = F
            )
        ), mainPanel(
            plotOutput("plot"),
            conditionalPanel(
                condition = "input.wants_table",
                dataTableOutput("user_data")
                )
            )
    )
    )
))
