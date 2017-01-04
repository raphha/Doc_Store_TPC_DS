{
   "language": "javascript",
   "views": {
       "q8": {
           "map": "function(doc) \n{\nvar g=doc.d_year;\nvar dow=doc.d_dow;\nif ((g==1998 || g==1999 || g==2000) && (dow==1)){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_coupon_amt;\nvar emp=store_sales.s_number_employees;\nvar ticket=store_sales.ss_ticket_number;\nvar s_city=store_sales.s_city;\nif(s==null){s=0}\nif(emp>=200 && emp<=295){\nfor each (customer in store_sales.customer){\nvar dep=customer.hd_dep_count;\nvar vehicle=customer.hd_vehicle_count;\nvar cust=customer.c_customer_sk;\n }\n if(dep==5 || vehicle>2){\n\t  \tfor each (item in store_sales.item){\n\t\t\tvar item_id=item.i_item_id;\n\t\t\t}\n\t\t\t   emit({ticket:ticket,c_customer_sk:cust,s_city:s_city},s);\n\t \t}   \n   }}}}",
           "reduce": "_sum"
       }
   }
}

