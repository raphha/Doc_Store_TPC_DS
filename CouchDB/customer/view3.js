{
   "language": "javascript",
   "views": {
       "q3": {
           "map": "function(doc) \n{ \n  var a=doc.ca_zip;\nif(a==35709){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_ext_sales_price;\nif(s==null){s=0}\nfor each (item in store_sales.item){\n var b=item.i_manager_id;\nvar c=item.i_brand_id;\nvar d=item.i_brand;\nvar e=item.i_manufact;\nvar f=item.i_manufact_id;} \n\tif (b==20){\n\t  \tfor each (date in store_sales.date){\n\t\t\tvar g=date.d_year;\n\t\t\tvar h=date.d_moy;}\n\t\t\tif (g==2001 && h==11){\n\t\t\t   emit({i_brand:d,i_brand_id:c,i_manufact_id:f,i_manufact:e},s);\n\t \t}   \n   }}}}",
           "reduce": "_sum"
       }
   }
}
