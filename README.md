## Introduction

In this project we look at how Neo4j can be used to analyze healthcare provider networks.

Some domains in healthcare are dynamic. They require constant changing of the data model. An example of this is insurance products and provider networks. Insurance products have properties that are updated from year to year. Some groups are added , removed and their properties are modified over time. Provider Networks also undergo changes from time to time. This can include adding or removing providers, changing in/out of network statuses.

For an organization that is analyzing this information, having rigid database schemas slows down the speed at which useful analytics products can be created.

One possible way to allow this dynamic nature of data models but still have a way to analyse the data quickly is to use a Graph database. Neo4j is one that comes to mind.

## The Project
As an example , we can use an openly available data set of some of New York’s providers that ca be found here. We will parse this data into a staging database (One column to hold the dynamic fields). We will then load the data into a Neo4j graph.

In this data-set, we will use the visualize the following domains:

  - Health Providers
  - States/Counties
  - Health Insurance Plan Names
  - Network Indicators – These show different groupings that each plan & provider are a part of.
  
We will 1st need to transform the data a little including some unpivoting to dynamically convert all the indicator and network columns to rows. We will use dbt to do this. I am a strong advocate for the use of sql based tools like dbt that can be used by majority of data professionals.

Then we will load the pivoted data into the graph, adding new nodes and edges (relationships) as we come across them. (See neo4j cipher queries used in the github link)

### Running the code:
```

```


Some screen shots of the resulting graphs:


![Screen-Shot-2021-02-16-at-11 25 53-PM-2048x1130](https://user-images.githubusercontent.com/66193559/179428265-f489007e-c856-4f2e-b750-402d37e1edc8.png)
![Screen-Shot-2021-02-16-at-11 23 18-PM-2048x1072](https://user-images.githubusercontent.com/66193559/179428266-813dfaeb-494d-4e4d-a4f6-e8a7d6761bb1.png)

