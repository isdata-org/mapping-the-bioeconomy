#never ever convert strings to factors
options(stringsAsFactors = FALSE)
library(SPARQL)

endpoint="http://live.dbpedia.org/sparql"

allOrganisms = c()
noMoreData = FALSE
offset = 0
while(noMoreData != TRUE){
  print(format(offset, scientific=FALSE))
  
  queryString = paste("select distinct(?x) where {
                      {?x dbo:phylum ?phylum } UNION 
                      {?x rdf:type dbo:Plant  } UNION
                      {?x rdf:type umbel-rc:Plant} .
} limit 10000 offset ", format(offset, scientific=FALSE), sep="")

  print("begin query")
  queryResults = SPARQL(url=endpoint, query=queryString, format='csv', extra=list(format='text/csv'))
  print("end query")
  data = queryResults$results
  
  Sys.sleep(5)
  
  if(dim(data)[1] > 0){
    allOrganisms = c(allOrganisms, data$x)
    offset = offset + 10000
  } else {
    noMoreData = TRUE
  }
  }


allChemicals = c()
noMoreData = FALSE
offset = 0
while(noMoreData != TRUE){
  print(format(offset, scientific=FALSE))
  
  queryString = paste("select distinct(?x) where {
	{?x rdf:type umbel-rc:ChemicalSubstanceType} UNION
	{?x dct:subject dbc:Chemical_elements} UNION
  {?x dct:subject dbc:Biomolecules} UNION 
	{?x rdf:type dbo:ChemicalSubstance} UNION
	{?x rdf:type dbo:ChemicalCompound} UNION
	{?x rdf:type dul:ChemicalObject} UNION
	{?x rdf:type yago:Chemical114806838 }
} limit 10000 offset ", format(offset, scientific=FALSE), sep="")
  
  print("begin query")
  queryResults = SPARQL(url=endpoint, query=queryString, format='csv', extra=list(format='text/csv'))
  print("end query")
  data = queryResults$results
  
  Sys.sleep(5)
  
  if(dim(data)[1] > 0){
    allChemicals = c(allChemicals, data$x)
    offset = offset + 10000
  } else {
    noMoreData = TRUE
  }
}

allOrganisms = sort(gsub("http://dbpedia.org/resource/", "", allOrganisms))
allChemicals = sort(gsub("http://dbpedia.org/resource/", "", allChemicals))

write.table(allOrganisms, "organisms.txt", sep=",", col.names=FALSE, row.names = FALSE, quote=FALSE)
write.table(allChemicals, "chemicals.txt", sep=",", col.names=FALSE, row.names = FALSE, quote=FALSE)