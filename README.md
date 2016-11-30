# mapping-the-bioeconomy
##Topic modelling and co-occurrence analysis of waste valorization pathways in the bio-economy

This is additional online material relating to the research presented in the article:
<i>Secondary Resources in the Bio-Based Economy:  A Computer Assisted Survey of Value Pathways in Academic Literature</i>

This additional material contains two main parts: the [Topic Modelling results](http://isdata-org.github.io/mapping-the-bioeconomy/TopicModelling/index.html) and the [Co-Occurence analysis results](https://github.com/isdata-org/mapping-the-bioeconomy/tree/master/CoOccurrenceAnalysis).

The topic modelling results groups the analyzed literature into algorithmically-determined topics.  This helps to cluster together similar literature, and by clicking on the topics, you can see the literature in each topic, along with trends over time.

With the co-occurrence analysis, we have also created an [online user interface](http://isdata-org.github.io/mapping-the-bioeconomy/CoOccurrenceAnalysis/CircleCoOccurLayout.html) (shown on the right side of the table below) which shows potential valorization pathways for waste products.  This is based on an analysis of literature where we located co-mentions of waste streams and TAPs (technologies, applications and products) in academic literature abstracts.  By selecting a combination of a waste stream and a TAP, you are then presented with literature references mentioning that combination.

<table cellspacing="0" cellpadding="0">
<tr>
<td width=400 valign="top"><center>Topic Modelling of Literature Analyzed</center></td>
<td width=420 valign="top"><center>Co-occurrence Mapping of Wastes and TAPs<br>(<b>T</b>echnologies, <b>A</b>pplications and <b>P</b>roducts)</center></td>
</tr>
<tr>
<td><a href="http://isdata-org.github.io/mapping-the-bioeconomy/TopicModelling/index.html"><img src="/ScreenShots/TopicModellingMainView.png" width="400"></a></td>
<td><a href="./CoOccurrenceAnalysis/README.md"><img src="./CoOccurrenceAnalysis/images/ExampleofUseGIF.gif" width="420"></a></td>
</tr>
</table>

## Abstract

> Research looking at expanding existing and developing novel value pathways for organic wastes has been steadily increasing in recent decades.  There have been few considerably broad overview studies of such materials and their valuation potential in the bio-based economy in part because of the vast multitude of materials and processes that can be used to produce energy carriers, chemicals, and materials of varying value. This article aims to explore how machine assisted information processing might help in analyzing large bodies of text to distill and present potential value pathways for secondary (waste) bio-based materials.  

> The study employed multiple methods (literature collection, Topic Modelling, and Co-occurrence Analysis of entities) on a collection of metadata (abstract, title, and keywords) from 53,292 academic articles in the general area of Technologies, Applications, and Products (TAPs) for bio-based wastes. The Topic Modelling (TM) presented an overview of 50 clusters of research around secondary organic resources, processes, and disciplines.  The Co-occurrence Analysis helped to understand which TAPs are researched in relation to a broad spectrum of organic resources. Co-occurrences were evaluated using the Normalized Pointwise Mutual Information (NPMI) measure to locate terms which co-occur more frequently than would be expected by chance.  Through the use of detailed lists of organic wastes and TAPs, the co-occurrence method mapped out 4,874 unique intersections between 1,515 specific wastes and 92 TAPs. 

> Our application of these techniques to the problem of surveying value pathways is shown as a proof-of-concept, and while still more refinement and application case studies need to be done, this work points the way to setting up a more generic system for wastes that can be used to suggest novel pathways for implementing the Circular Economy.
