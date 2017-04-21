Can we improve upon the 'Knowledge Accelerator' by devising a better subset selection method to construct a coherent argument in a crowdsourced environment?

# Previous Work
* Hahn - Knowledge accelerator. Aim here was to develop a 'big picture view entirely through small contributions of individuals'. 
* Nisrag

## Positive aspects
* Hahn - demonstration of generation topics (*finding sources* and *filtering* through relevant themes). "Inducing  categories  in  unstructured  collections  of  text  typically requires understanding the global context in order to identify categories that are representative of the information". However, this is where we think better work can be performed.
* Chilton - crowd source hierarchical structure to a random dataset.
* Nisrag -  "assumes that voters have latent utility functions that induce the reported rankings, and seeks voting rules that approximately maximize utilitarian social welfare".

## Negative aspects
In both the knowledge accelerator and cascade, workers are required to vote on relevant content. In the case of Cascade, the vote is to assign a topic to a category and for the knowledge accelerator the 'vote-then-edit' pattern [see below] is used to iteratively include/edit a relevant description of the topic at hand. 
* Hahn misses some key issues while duplicates others. We are looking to filter and pre-vote on useful topic before the content aggregation stage.
* Nisrag has focused on an aggregation of preferences. He did not extend this work to the case where topics are to be included in a document.

# Experiment Design
## Step 1:
Identify relevant opinion text pieces. These writings must include an argument with a clear logical flow. 

## Step 2:
Select a subset of relevant points from the document. Include a randomized set of irrelevant points. 

## Step 3:
Have a crowd vote on the relevant topics in the document using both:
1 - ranking based on Caragiannis.
2 - naive selection of all relevant topics.
3 - selection of most relevant topic.
*Notes:* Randomize the order of instructions for different people.

## Step 4:
Aggregate results. 


# Useful sections of paper:
* Hahn - Need a more structured voting algorithm than this: "We used the vote-then-edit pattern in an interleaved 'horizontal' and 'vertical' work flow. The horizontal phase uses the refined and edited versions of a subtopic section as a 'model' for improving the rough output from the integration phase for another subtopic section.  Specifically, three workers vote on which of three versions of an edited subtopic section is the best and then edit a different subtopic subsection using their answer from voting as a model. Their resulting edited output is sent to the vertical phase, in which three workers vote on which of those versions is the best, and are then asked to further improve this now with all of the other subtopic paragraphs presented to them, to ensure the current subtopic has good flow with the other sections. The output from these workers is used in a new horizontal phase, and the cycle continues. The intuition here is that the horizontal phase provides only a single section as a model since there is substantive editing work remaining that requires relatively limited context, while the vertical phase provides all sections because the primary editing work remaining is ensuring consistency across sections"