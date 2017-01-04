{
   "language": "javascript",
   "views": {
       "q10": {
           "map": "function(doc) \n{\nvar g=doc.d_year;\nvar moy=doc.d_moy;\nif (g==2000){\n    for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_sales_price;\nvar s_name=store_sales.s_store_name;\nvar s_company=store_sales.s_company_name;\nif(s==null){s=0}\n\t  \tfor each (item in store_sales.item){\n\t\t\t}\n\t\t\t var brand=item.i_brand;\n\t\t\t var item_desc=item.i_item_desc;\n\t\t\t var category=item.i_category;\n\t\t\t var class=item.i_class;\n\t\t\t var price=item.i_current_price;\n\t\t\t if(((category==\"Music\" || category==\"Home\" || category==\"Sports\") && \n(class==\"country\" || class==\"rugs\" || class==\"fishing\")) || \n((category==\"Women\" || category==\"Men\" || category==\"Children\") && \n(class==\"swimwear\" || class==\"shirts\" || class==\"pants\"))){\n\t\t\t   emit({category:category,class:class, brand:brand, \nclass:class,s_name:s_name,s_company:s_company, moy:moy},s);\n\t \t}   \n   }}} ",
           "reduce": "_sum"
       }
   }
}
