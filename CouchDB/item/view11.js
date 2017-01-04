{
   "language": "javascript",
   "views": {
       "q11": {
           "map": "function(doc) \n{ \n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_ext_sales_price;\nvar ticket=store_sales.ss_ticket_number;\nvar s_store_name=store_sales.s_store_name;\nif(s==null){s=0}\nif(s_store_name==\"ese\"){\n\t  \tfor each (customer in store_sales.customer){\n\t\t\tvar dep=customer.hd_dep_count;\n\t\t\tvar vehicle=customer.hd_vehicle_count;\n\t\t\tvar last=customer.c_last_name;\n\t\t\tvar first=customer.c_first_name;\n\t\t\tvar city=customer.ca_city;\n\t\t\t}\n\t\t\tif(dep==3){\n\t  \tfor each (time in store_sales.time){\n\t\t\tvar g=time.t_hour;\n\t\t\tvar h=time.t_minute;\n\t\t\t}\n\t\t\tif (g==12 && h>=30){\n\t\t\t   emit({last_name:last,first_name:first,ca_city:city,ticket:ticket},s);\n\t \t}   \n   }}}}",
           "reduce": "_count"
       }
   }
}