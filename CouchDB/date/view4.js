{
   "language": "javascript",
   "views": {
       "q4": {
           "map": "function(doc) \n{\nvar g=doc.d_year;\nif (g==2001){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_sales_price;\nvar state=store_sales.s_state;\nif(s==null){s=0}\nif(state==\"TN\"){\nfor each (customer in store_sales.customer){\nvar gender=customer.cd_gender;\nvar marital=customer.cd_marital_status;\nvar education=customer.cd_education_status;\n }\n if(gender==\"F\" && marital==\"S\" && education==\"Secondary\"){\n\t  \tfor each (item in store_sales.item){\n\t\t\tvar item_id=item.i_item_id;}\n\t\t\t   emit({item_id:item_id,s_state:state},s);\n\t \t}   \n   }}}}",
           "reduce": "_sum"
       }
   }
}
