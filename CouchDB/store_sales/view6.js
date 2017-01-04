{
   "language": "javascript",
   "views": {
       "q6": {
           "map": "function(doc){\n\t\tvar s=doc.ss_ext_sales_price;\n\t\tvar t=doc.ss_ticket_number;\n\t\tif(s==null){s=0}\n\t\tif(doc.s_city==\"Midway\"){\n\t\tfor each (customer in doc.customer){var a=customer.c_last_name;\nvar b=customer.c_first_name;\nvar c=customer.ca_city;}\nif(customer.hd_dep_count==4 || customer.hd_vehicle_count==2){\t\t\n\t\t\t\tfor each (date in doc.date){var y=date.d_year;\tvar d=date.d_dom;}\n\t\t\t\t\tif ((y>=1999 && y<=2001) && (d>=20 && d<=21)){emit({last:a,first:b,ca_city:c,ticket:t},s);}   \n\t\t   }}}",
           "reduce": "_sum"
       }
   }
}

