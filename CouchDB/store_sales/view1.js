{
   "language": "javascript",
   "views": {
       "q1": {
           "map": "function(doc) \n{ \nvar s=doc.ss_sales_price;\nif(s==null){s=0}\nfor each (item in doc.item){ var a=item.i_manufact_id; \n var b=item.i_brand_id; \n var c=item.i_brand;}\n  if (a==600){\n\t  \tfor each (date in doc.date){var d=date.d_moy; var e=date.d_year;}\n\t\t\tif (d==12){emit({d_year:e,i_brand:c, i_brand_id:b}, s);\n\t \t}   \n   }}",
           "reduce": "_sum"
       }
   }
}