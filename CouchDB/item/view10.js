{
   "language": "javascript",
   "views": {
       "q10": {
           "map": "function(doc) \n{\n var brand=doc.i_brand;\n var item_desc=doc.i_item_desc;\n var category=doc.i_category;\n var class=doc.i_class;\n var price=doc.i_current_price;\n if(((category==\"Music\" || category==\"Home\" || category==\"Sports\") && \n(class==\"country\" || class==\"rugs\" || class==\"fishing\")) || \n((category==\"Women\" || category==\"Men\" || category==\"Children\") && \n(class==\"swimwear\" || class==\"shirts\" || class==\"pants\"))){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_sales_price;\nvar s_name=store_sales.s_store_name;\nvar s_company=store_sales.s_company_name;\nif(s==null){s=0}\n\t  \tfor each (date in store_sales.date){\n\t\t\tvar g=date.d_year;\n\t\t\tvar moy=date.d_moy;}\n\t\t\tif (g==2000){\n\t\t\t   emit({category:category,class:class, brand:brand, \nclass:class,s_name:s_name,s_company:s_company, moy:moy},s);\n\t \t}   \n   }}} ",
           "reduce": "_sum"
       }
   }
}
