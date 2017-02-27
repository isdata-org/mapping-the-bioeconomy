#never ever convert strings to factors
options(stringsAsFactors = FALSE)
library(SPARQL)

endpoint="https://query.wikidata.org/bigdata/namespace/wdq/sparql"

# should get RDF descriptions for all entities returned

allChemicals = c()
noMoreData = FALSE
offset = 0
while(noMoreData != TRUE){
  print(format(offset, scientific=FALSE))

  queryString = paste("PREFIX p: <http://www.wikidata.org/prop/>
                      PREFIX v: <http://www.wikidata.org/prop/statement/>
                      PREFIX : <http://www.wikidata.org/entity/>
                      PREFIX schema: <http://schema.org/>
                      PREFIX wikidata: <http://www.wikidata.org/ontology#>

                      select distinct ?name ?wikiData where {
                        ?wikiData rdfs:label ?name .
                        FILTER(langMatches(lang(?name), \"EN\")) .
                        # P31 - instance of
                        # P279 - subclass of
                        # Q11344 - chemical element
                        # Q11173 - chemical compound
                        # Q12140 - pharmaceutical drug
                        { ?wikiData p:P31/v:P31 :Q11344 } UNION # instance of chemical element
                        { ?wikiData p:P31/v:P31 :Q11173 } UNION # instance of chemical compound
                        { ?wikiData p:P31/v:P31 :Q12140 } UNION  # instance of pharmaceutical drug
                        { ?wikiData p:P279/v:P279 :Q11344 } UNION # subclass of chemical element
                        { ?wikiData p:P279/v:P279 :Q11173 } UNION # subclass of chemical compound
                        { ?wikiData p:P279/v:P279 :Q12140 } . # subclass of pharmaceutical drug
                      } limit 10000 offset ", format(offset, scientific=FALSE), sep="")

  print("begin query")
  #queryResults = SPARQL(url=endpoint, query=queryString, format='csv', extra=list(format='text/csv'))
  queryResults = SPARQL(url=endpoint, query=queryString)
  print("end query")
  data = queryResults$results

  #Sys.sleep(5)

  if(dim(data)[1] > 0){
    allChemicals = rbind(allChemicals, data)
    offset = offset + 10000
  } else {
    noMoreData = TRUE
  }
}

write.table(allChemicals, "wikidata_chemicals.txt", sep="\t", col.names=FALSE, row.names = FALSE, quote=FALSE)



# type of taxon :Q16521
# encyclopedia of life id: P830

allOrganisms = c()
noMoreData = FALSE
offset = 0
while(noMoreData != TRUE){
  print(format(offset, scientific=FALSE))

  queryString = paste("PREFIX p: <http://www.wikidata.org/prop/>
                      PREFIX v: <http://www.wikidata.org/prop/statement/>
                      PREFIX : <http://www.wikidata.org/entity/>
                      PREFIX schema: <http://schema.org/>
                      PREFIX wikidata: <http://www.wikidata.org/ontology#>
                      select distinct ?wikiPage ?wikiData ?eol_id where {
                        ?wikiPage schema:isPartOf <https://en.wikipedia.org/> . 
                        ?wikiPage rdf:type schema:Article . 
                        ?wikiPage schema:about ?wikiData . 
                        ?wikiData p:P830/v:P830 ?eol_id . # Encyclopedia of Life ID
                      } limit 1000 offset ", format(offset, scientific=FALSE), sep="")

  print("begin query")
  # Can't get CSV download to work
  #queryResults = SPARQL(url=endpoint, query=queryString, format='csv', extra=list(format='text/csv'))
  #queryResults = SPARQL(url=endpoint, query=queryString, format='csv', extra=list(Accept='text/csv', format='text/csv'))
  queryResults = SPARQL(url=endpoint, query=queryString)
  print("end query")
  data = queryResults$results

  #Sys.sleep(5)

  if(dim(data)[1] > 0){
    allOrganisms = rbind(allOrganisms, data)
    offset = offset + 1000
  } else {
    noMoreData = TRUE
  }
}



allOrganisms = sort(gsub("http://dbpedia.org/resource/", "", allOrganisms))
allChemicals = sort(gsub("http://dbpedia.org/resource/", "", allChemicals))

write.table(allOrganisms, "organisms.txt", sep=",", col.names=FALSE, row.names = FALSE, quote=FALSE)
write.table(allChemicals, "chemicals.txt", sep=",", col.names=FALSE, row.names = FALSE, quote=FALSE)
