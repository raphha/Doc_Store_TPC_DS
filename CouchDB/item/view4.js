{
   "language": "javascript",
   "views": {
       "q4": {
           "map": "function(doc) \n{\nvar item_id=doc.i_item_id;\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_sales_price;\nvar state=store_sales.s_state;\nif(s==null){s=0}\nif(state==\"TN\"){\nfor each (customer in store_sales.customer){\nvar gender=customer.cd_gender;\nvar marital=customer.cd_marital_status;\nvar education=customer.cd_education_status;\n }\n if(gender==\"F\" && marital==\"S\" && education==\"Secondary\"){\n\t  \tfor each (date in store_sales.date){\n\t\t\tvar g=date.d_year;}\n\t\t\tif (g==2001){\n\t\t\t   emit({item_id:item_id,s_state:state},s);\n\t \t}   \n   }}}}",
           "reduce": "_sum"
       }
   }
}
