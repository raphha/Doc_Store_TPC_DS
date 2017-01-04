{
   "language": "javascript",
   "views": {
       "q6": {
           "map": "function(doc){\nvar y=doc.d_year;\t\nvar d=doc.d_dom;\nif ((y>=1999 && y<=2001) && (d>=20 && d<=21)){\n\tfor each (store_sales in doc.store_sales){\n\t\tvar s=store_sales.ss_ext_sales_price;\n\t\tvar t=store_sales.ss_ticket_number;\n\t\tif(s==null){s=0}\n\t\tif(store_sales.s_city==\"Midway\"){\n\t\tfor each (customer in store_sales.customer){var a=customer.c_last_name;\nvar b=customer.c_first_name;\nvar c=customer.ca_city;}\nif(customer.hd_dep_count==4 || customer.hd_vehicle_count==2){\t\n\t\t\t\t\temit({last:a,first:b,ca_city:c,ticket:t},s);}   \n\t\t   }}}}",
           "reduce": "_sum"
       }
   }
}

