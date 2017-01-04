{
   "language": "javascript",
   "views": {
       "q3": {
           "map": "function(doc) \n{\nvar s=doc.ss_ext_sales_price;\nif(s==null){s=0}\nfor each (customer in doc.customer){\nvar a=customer.ca_zip; }\nif(a==35709){\nfor each (item in doc.item){\nvar b=item.i_manager_id;\nvar c=item.i_brand_id;\nvar d=item.i_brand;\nvar e=item.i_manufact;\nvar f=item.i_manufact_id; }\nif (b==20){\n\t  \tfor each (date in doc.date){\n\t\t\tvar g=date.d_year;\n\t\t\tvar h=date.d_moy;}\n\t\t\tif (g==2001 && h==11){\n\t\t\t   emit({i_brand:d,i_brand_id:c,i_manufact_id:f,i_manufact:e},s);\n\t \t}   \n   }}}",
           "reduce": "_sum"
       }
   }
}
