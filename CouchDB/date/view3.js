{
   "language": "javascript",
   "views": {
       "q3": {
           "map": "function(doc) \n{\nvar g=doc.d_year;\nvar h=doc.d_moy;\nif (g==2001 && h==11){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_ext_sales_price;\nif(s==null){s=0}\nfor each (customer in store_sales.customer){\nvar a=customer.ca_zip; }\nif(a==35709){\n\t  \tfor each (item in store_sales.item){\n\t\t\tvar b=item.i_manager_id;\n\t\t\tvar c=item.i_brand_id;\n\t\t\tvar d=item.i_brand;\n\t\t\tvar e=item.i_manufact;\n\t\t\tvar f=item.i_manufact_id;}\n\t\t\tif (b==20){\n\t\t\t   emit({i_brand:d,i_brand_id:c,i_manufact_id:f,i_manufact:e},s);\n\t \t}   \n   }}}}",
           "reduce": "_sum"
       }
   }
}
