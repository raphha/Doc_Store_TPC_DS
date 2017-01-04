{
   "language": "javascript",
   "views": {
       "q2": {
           "map": "function(doc) \n{\nvar e=doc.d_year;\nif (e==2001){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_sales_price;\nif(s==null){s=0}\nfor each (customer in store_sales.customer){\nvar c=customer.ca_state; \n } \t\n\t  \tfor each (item in store_sales.item){\n\t\t\tvar a=item.i_current_price;}\n\t\t\tif (a>9){\n\t\t\t   emit(c,1);\n\t \t}   \n   }}}",
           "reduce": "_count"
       }
   }
}