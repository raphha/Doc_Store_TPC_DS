{
   "language": "javascript",
   "views": {
       "q9": {
           "map": "function(doc) \n{\nvar g=doc.t_hour;\nvar h=doc.t_minute;\nif (g==8 && h>=30){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_ext_sales_price;\nvar ticket=store_sales.ss_ticket_number;\nvar s_store_name=store_sales.s_store_name;\nif(s==null){s=0}\nif(s_store_name==\"ese\"){\nfor each (customer in store_sales.customer){\n\t\t\tvar dep=customer.hd_dep_count;\nvar vehicle=customer.hd_vehicle_count;\nvar last=customer.c_last_name;\nvar first=customer.c_first_name;\nvar city=customer.ca_city;\n\t\t\t}\nif((dep==1 && vehicle<=3) || (dep==2 && vehicle<=4) || (dep==3 && vehicle<=5)){\n\t\t\t   emit({last_name:last,first_name:first,ca_city:city,ticket:ticket},s);\n\t \t}   \n   }}}}",
           "reduce": "_count"
       }
   }
}
