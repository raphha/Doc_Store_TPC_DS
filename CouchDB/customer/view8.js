{
   "language": "javascript",
   "views": {
       "q8": {
           "map": "function(doc) \n{ \nvar dep=doc.hd_dep_count;\nvar vehicle=doc.hd_vehicle_count;\nvar cust=doc.c_customer_sk\nif(dep==5 || vehicle>2){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_coupon_amt;\nvar emp=store_sales.s_number_employees;\nvar ticket=store_sales.ss_ticket_number;\nvar s_city=store_sales.s_city;\nif(s==null){s=0}\nif(emp>=200 && emp<=295){\nfor each (item in store_sales.item){\n var item_id=item.i_item_id;} \n\t  \tfor each (date in store_sales.date){\n\t\t\tvar g=date.d_year;\n\t\t\tvar dow=date.d_dow;\n\t\t\t}\n\t\t\tif ((g==1998 || g==1999 || g==2000) && (dow==1)){\n\t\t\t   emit({ticket:ticket,c_customer_sk:cust,s_city:s_city},s);\n\t \t}   \n   }}}}",
           "reduce": "_sum"
       }
   }
}

