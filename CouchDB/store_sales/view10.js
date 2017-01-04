{
   "language": "javascript",
   "views": {
       "q10": {
           "map": "function(doc) \n{\nvar s=doc.ss_sales_price;\nvar s_name=doc.s_store_name;\nvar s_company=doc.s_company_name;\nif(s==null){s=0}\nfor each (item in doc.item){\n\t\t\t var brand=item.i_brand;\n\t\t\t var item_desc=item.i_item_desc;\n\t\t\t var category=item.i_category;\n\t\t\t var class=item.i_class;\n\t\t\t var price=item.i_current_price;}\n\t\t\t  if(((category==\"Music\" || category==\"Home\" || category==\"Sports\") && \n(class==\"country\" || class==\"rugs\" || class==\"fishing\")) || \n((category==\"Women\" || category==\"Men\" || category==\"Children\") && \n(class==\"swimwear\" || class==\"shirts\" || class==\"pants\"))){\n\t  \tfor each (date in doc.date){\n\t\t\tvar g=date.d_year;\n\t\t\tvar moy=date.d_moy;}\n\t\t\tif (g==2000){\n\t\t\t   emit({category:category,class:class, brand:brand, \nclass:class,s_name:s_name,s_company:s_company, moy:moy},s);\n\t \t}   \n   }}",
           "reduce": "_sum"
       }
   }
}
