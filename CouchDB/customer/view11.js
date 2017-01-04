{
   "language": "javascript",
   "views": {
       "q11": {
           "map": "function(doc) \n{ \nvar dep=doc.hd_dep_count;\nvar vehicle=doc.hd_vehicle_count;\nvar last=doc.c_last_name;\nvar first=doc.c_first_name;\nvar city=doc.ca_city;\nif(dep==3){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_ext_sales_price;\nvar ticket=store_sales.ss_ticket_number;\nvar s_store_name=store_sales.s_store_name;\nif(s==null){s=0}\nif(s_store_name==\"ese\"){\n\t  \tfor each (time in store_sales.time){\n\t\t\tvar g=time.t_hour;\n\t\t\tvar h=time.t_minute;\n\t\t\t}\n\t\t\tif (g==12 && h>=30){\n\t\t\t   emit({last_name:last,first_name:first,ca_city:city,ticket:ticket},s);\n\t \t}   \n   }}}}",
           "reduce": "_count"
       }
   }
}
