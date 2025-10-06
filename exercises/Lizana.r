library(haven)

tf_household <- tempfile()

this_url_household <-
  "https://www2.census.gov/programs-surveys/acs/data/pums/2023/1-Year/sas_hal.zip"

download.file( this_url_household , tf_household , mode = 'wb' )

unzipped_files_household <- unzip( tf_household , exdir = tempdir() )

acs_sas_household <-
  grep( '\\.sas7bdat$' , unzipped_files_household , value = TRUE )

acs_df_household <- read_sas( acs_sas_household )

names( acs_df_household ) <- tolower( names( acs_df_household ) )







tf_person <- tempfile()

this_url_person <-
  "https://www2.census.gov/programs-surveys/acs/data/pums/2023/1-Year/sas_pal.zip"

download.file( this_url_person , tf_person , mode = 'wb' )

unzipped_files_person <- unzip( tf_person , exdir = tempdir() )

acs_sas_person <-
  grep( '\\.sas7bdat$' , unzipped_files_person , value = TRUE )

acs_df_person <- read_sas( acs_sas_person )

names( acs_df_person ) <- tolower( names( acs_df_person ) )



acs_df_household[ , 'rt' ] <- NULL

acs_df_person[ , 'rt' ] <- NULL

acs_df <- merge( acs_df_household , acs_df_person )

stopifnot( nrow( acs_df ) == nrow( acs_df_person ) )

acs_df[ , 'one' ] <- 1




acs_fn <- file.path( path.expand( "~" ) , "ACS" , "this_file.rds" )
saveRDS( acs_df , file = acs_fn , compress = FALSE )


acs_df <- readRDS( acs_fn )





library(survey)

acs_design <-
  svrepdesign(
    weight = ~pwgtp ,
    repweights = 'pwgtp[0-9]+' ,
    scale = 4 / 80 ,
    rscales = rep( 1 , 80 ) ,
    mse = TRUE ,
    type = 'JK1' ,
    data = acs_df
  )





acs_design <-
  update(
    
    acs_design ,
    
    state_name =
      factor(
        as.numeric( state ) ,
        levels = 
          c(1L, 2L, 4L, 5L, 6L, 8L, 9L, 10L, 
            11L, 12L, 13L, 15L, 16L, 17L, 18L, 
            19L, 20L, 21L, 22L, 23L, 24L, 25L, 
            26L, 27L, 28L, 29L, 30L, 31L, 32L, 
            33L, 34L, 35L, 36L, 37L, 38L, 39L, 
            40L, 41L, 42L, 44L, 45L, 46L, 47L, 
            48L, 49L, 50L, 51L, 53L, 54L, 55L, 
            56L, 72L) ,
        labels =
          c("Alabama", "Alaska", "Arizona", "Arkansas", "California", 
            "Colorado", "Connecticut", "Delaware", "District of Columbia", 
            "Florida", "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", 
            "Iowa", "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland", 
            "Massachusetts", "Michigan", "Minnesota", "Mississippi", "Missouri", 
            "Montana", "Nebraska", "Nevada", "New Hampshire", "New Jersey", 
            "New Mexico", "New York", "North Carolina", "North Dakota", "Ohio", 
            "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island", "South Carolina", 
            "South Dakota", "Tennessee", "Texas", "Utah", "Vermont", "Virginia", 
            "Washington", "West Virginia", "Wisconsin", "Wyoming", "Puerto Rico")
      ) ,
    
    cit =
      factor( 
        cit , 
        levels = 1:5 , 
        labels = 
          c( 
            'born in the u.s.' ,
            'born in the territories' ,
            'born abroad to american parents' ,
            'naturalized citizen' ,
            'non-citizen'
          )
      ) ,
    
    poverty_level = as.numeric( povpip ) ,
    
    married = as.numeric( mar %in% 1 ) ,
    
    sex = factor( sex , labels = c( 'male' , 'female' ) )
  )






sum( weights( acs_design , "sampling" ) != 0 )

svyby( ~ one , ~ cit , acs_design , unwtd.count )





svytotal( ~ one , acs_design )

svyby( ~ one , ~ cit , acs_design , svytotal )






svymean( ~ poverty_level , acs_design , na.rm = TRUE )

svyby( ~ poverty_level , ~ cit , acs_design , svymean , na.rm = TRUE )



svyratio( 
  numerator = ~ ssip , 
  denominator = ~ pincp , 
  acs_design ,
  na.rm = TRUE
)



sub_acs_design <- subset( acs_design , agep >= 65 )

svymean( ~ poverty_level , sub_acs_design , na.rm = TRUE )



svyttest( poverty_level ~ married , acs_design )




svychisq( 
  ~ married + sex , 
  acs_design 
)



glm_result <- 
  svyglm( 
    poverty_level ~ married + sex , 
    acs_design 
  )

summary( glm_result )




install.packages("srvyr")


library(srvyr)
acs_srvyr_design <- as_survey( acs_design )


acs_srvyr_design %>%
  summarize( mean = survey_mean( poverty_level , na.rm = TRUE ) )

acs_srvyr_design %>%
  group_by( cit ) %>%
  summarize( mean = survey_mean( poverty_level , na.rm = TRUE ) )


acs_design






parents <- acs_df %>%
  filter(relate %in% c("parent", "mother", "father", appropriate codes)) %>%
  mutate(parent_foreign = ifelse(birthplace != U.S. code, 1, 0)) %>%
  select(serialno, parent_foreign, person_id_parent = person_id)
