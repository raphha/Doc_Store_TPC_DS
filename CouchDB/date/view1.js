{
   "language": "javascript",
   "views": {
       "q1": {
           "map": "function(doc) \n{\nvar d=doc.d_moy; \nvar e=doc.d_year; \n if (d==12){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_sales_price;\nif(s==null){s=0}\n\t  \tfor each (item in store_sales.item){ var a=item.i_manufact_id; \n var b=item.i_brand_id; \n var c=item.i_brand;}\n\t\t\tif (a==600){emit({d_year:e,i_brand:c, i_brand_id:b}, s);\n\t \t}   \n   }}}",
           "reduce": "_sum"
       }
   }
}