{
   "language": "javascript",
   "views": {
       "q2": {
           "map": "function(doc) \n{\nvar s=doc.ss_sales_price;\nif(s==null){s=0}\nfor each (customer in doc.customer){\nvar c=customer.ca_state; \n } \n for each (item in doc.item){\nvar a=item.i_current_price;\n }\n if (a>9){\n\t  \tfor each (date in doc.date){\n\t\t\tvar e=date.d_year;}\n\t\t\tif (e==2001){\n\t\t\t   emit(c,1);\n\t \t}   \n   }}",
           "reduce": "_count"
       }
   }
}
