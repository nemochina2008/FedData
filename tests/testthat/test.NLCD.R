library(FedData)
library(httr)
context("National Land Cover Dataset tests")

test_that("The NLCD tiles are available at the correct URL", {
  year = 2011
  dataset = "landcover"
  tileName = "N36W108"
  
  if(dataset == "landcover"){
    dataset_abbr <- "LC"
  }else if(dataset == "impervious"){
    dataset_abbr <- "IMP"
  }else if(dataset == "canopy"){
    dataset_abbr <- "CAN"
  }else{
    stop("Parameter 'dataset' must be one of 'landcover', 'impervious', or 'canopy'.")
  }
  
  url <- paste0("https://prd-tnm.s3.amazonaws.com/StagedProducts/NLCD/data/",
                year, "/",
                dataset,
                "/3x3/NLCD",
                year, "_",
                dataset_abbr, "_",
                tileName,
                ".zip")
  expect_false(suppressWarnings(httr::http_error(url)))
  
  tileName = "N36W200"
  url <- paste0("https://prd-tnm.s3.amazonaws.com/StagedProducts/NLCD/data/",
                year, "/",
                dataset,
                "/3x3/NLCD",
                year, "_",
                dataset_abbr, "_",
                tileName,
                ".zip")
  expect_true(suppressWarnings(httr::http_error(url)))
})
