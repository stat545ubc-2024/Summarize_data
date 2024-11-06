#Test to confirm a summary tibble is generated
library(palmerpenguins)
test_that("A table is generated as the ouput", 
          {expect_gt(length(summarize_data(penguins,species,summ_vars=bill_length_mm
                                           ,na.rm=TRUE)),0)
            expect_gt(nrow(summarize_data(penguins,species,summ_vars=bill_length_mm,
                                          na.rm=FALSE)),0)
          })


#Test if rejecting non_numeric variable as the summ_vars input or providing a group_by variable not exist in the data 

test_that("run into error ",
          {expect_error(summarize_data(penguins,island,summ_vars=sex
                                       ,na.rm=TRUE))
            expect_error(summarize_data(penguins,languages,summ_vars=sex
                                        ,na.rm=TRUE))
          })


#Test if an expected value is generated 
#I first generated the median results using dplyr filtering to confirm the ideal output 

expected_summary<-penguins%>%
  group_by(species,island)%>%
  summarize(median=median(bill_length_mm,na.rm=TRUE),mean=mean(bill_length_mm,na.rm=TRUE),sd=sd(bill_length_mm,na.rm=TRUE))

#I then ran  the test to see if the same output is generated

test_that ("generate the same out put",{
  expect_equal(summarize_data(penguins,species,island,summ_vars=bill_length_mm
                              ,na.rm=TRUE),expected_summary)
})
