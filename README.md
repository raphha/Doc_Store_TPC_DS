# Doc_Store_TPC_DS

TPC-DS queries on different aggregate modeling

This project has some of the TPC-DS queries of five Document Store Database Systems executed on the five possible different aggregate modelings.

The original benchmark TPC-DS can be found on http://www.tpc.org/tpcds/.

Thought its generator it's possible to generate numerous data sizes.

After the generation, it's possible to insert the TPC-DS data to a relational database as POSTGRESQL and convert the data to JSON format. 

The TPC-DS has seven schemas that is used for the proposed benchmark.

This repository uses just one of its schema (the Store_Sales schema) and demonstrate a way to convert it's data to JSON documents, so it can be used on Document Store Database Systems.

To limit the depth of the documents to 3 levels, some tables of this schema had been normalized, so the result schema is a star schema (TPC-DS schema Adaptation). 

After the schema adaptation it's necessary to eliminate some data from the tables, so the result JSON can have the same data. For example. Some orders created by the TPC-DS don't have the Client data, so the aggregate modeling based on the Client table would not have those orders. Another alternative was to create a id for this cases, but we choose to avoid orders with empty data. 

From the adapted schema it's possible to create five aggregate modeling using each table as the base for the JSON document (document=aggregate on document store database systems).

One sample of query to generate the aggregate modeling based on the Customer table can be seen on POSTGRESQL query.

We recomend the use of indexes to faster JSON generation.

After the generation of the JSON it's possible to insert it on Document Store Database Systems and the TPC-DS queries can be executed and tested.

Because of the use of only one schema of the TPC-DS benchmark, that was modified, the queries had to be altered to use the new schema created. Furthermore, the filters used on the queries was filled randomly. These modifications can be seen on the file schema adaptation.  

On this project the query sintax of 5 DBMS is presented: MongoDB, ElasticSearch, OrientDB, CouchDB and MarkLogic.

Each DBMS folder has 5 sub-folder with queries on different aggregate modelings, for example the sub-folder customer inside the folder MongoDB represents the SSB queries on aggregate modeling based on Customer table.

Because OrientDB has two way to organize its data its folder contains two sub-folders called linked documents and nested documents.

If the sub-folder has a folder called indexes, it means that for the use of indexes it was necessary re-write the queries on that database to use this feature.
