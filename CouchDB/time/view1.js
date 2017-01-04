{
   "language": "javascript",
   "views": {
       "q1": {
           "map": "function(doc) \n{ \n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_sales_price;\nif(s==null){s=0}\nfor each (item in store_sales.item){ var a=item.i_manufact_id; \n var b=item.i_brand_id; \n var c=item.i_brand;}\n  if (a==600){\n\t  \tfor each (date in store_sales.date){var d=date.d_moy; var e=date.d_year;}\n\t\t\tif (d==12){emit({d_year:e,i_brand:c, i_brand_id:b}, s);\n\t \t}   \n   }}}",
           "reduce": "_sum"
       }
   }
}