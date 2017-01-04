{
   "language": "javascript",
   "views": {
       "q3": {
           "map": "function(doc) \n{\nvar b=doc.i_manager_id;\nvar c=doc.i_brand_id;\nvar d=doc.i_brand;\nvar e=doc.i_manufact;\nvar f=doc.i_manufact_id;\nif (b==20){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_ext_sales_price;\nif(s==null){s=0}\nfor each (customer in store_sales.customer){\nvar a=customer.ca_zip; }\nif(a==35709){\n\t  \tfor each (date in store_sales.date){\n\t\t\tvar g=date.d_year;\n\t\t\tvar h=date.d_moy;}\n\t\t\tif (g==2001 && h==11){\n\t\t\t   emit({i_brand:d,i_brand_id:c,i_manufact_id:f,i_manufact:e},s);\n\t \t}   \n   }}}}",
           "reduce": "_count"
       }
   }
}
