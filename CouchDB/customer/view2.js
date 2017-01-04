{
   "language": "javascript",
   "views": {
       "q2": {
           "map": "function(doc) \n{ \n  var c=doc.ca_state;\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_sales_price;\nif(s==null){s=0}\nfor each (item in store_sales.item){\n var a=item.i_current_price;} \n\tif (a>9){\n\t  \tfor each (date in store_sales.date){\n\t\t\tvar e=date.d_year;}\n\t\t\tif (e==2001){\n\t\t\t   emit(c,1);\n\t \t}   \n   }}}",
           "reduce": "_sum"
       }
   }
}
