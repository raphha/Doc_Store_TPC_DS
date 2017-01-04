{
   "language": "javascript",
   "views": {
       "q2": {
           "map": "function(doc) \n{\nvar a=doc.i_current_price;\nif (a>9){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_sales_price;\nif(s==null){s=0}\nfor each (customer in store_sales.customer){\nvar c=customer.ca_state; \n } \t\n\t  \tfor each (date in store_sales.date){\n\t\t\tvar e=date.d_year;}\n\t\t\tif (e==2001){\n\t\t\t   emit(c,1);\n\t \t}   \n   }}}",
           "reduce": "_count"
       }
   }
}