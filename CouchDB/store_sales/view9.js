{
   "language": "javascript",
   "views": {
       "q9": {
           "map": "function(doc) \n{\nvar s=doc.ss_ext_sales_price;\nvar ticket=doc.ss_ticket_number;\nvar s_store_name=doc.s_store_name;\nif(s==null){s=0}\nif(s_store_name==\"ese\"){\nfor each (time in doc.time) {\nvar g=time.t_hour;\nvar h=time.t_minute;}\nif (g==8 && h>=30){\nfor each (customer in doc.customer){\n\t\t\tvar dep=customer.hd_dep_count;\n\t\t\tvar vehicle=customer.hd_vehicle_count;\n\t\t\tvar last=customer.c_last_name;\n\t\t\tvar first=customer.c_first_name;\n\t\t\tvar city=customer.ca_city;\n\t\t\t}\nif((dep==1 && vehicle<=3) || (dep==2 && vehicle<=4) || (dep==3 && vehicle<=5)){\n\t\t\t   emit({last_name:last,first_name:first,ca_city:city,ticket:ticket},s);\n\t \t}   \n   }}}",
           "reduce": "_count"
       }
   }
}