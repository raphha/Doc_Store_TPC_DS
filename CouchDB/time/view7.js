{
   "language": "javascript",
   "views": {
       "q7": {
           "map": "function(doc) \n{\nvar meal_time=doc.t_meal_time;\nvar hour=doc.t_hour;\nvar minute=doc.t_minute;\nif (meal_time==\"breakfast\" || meal_time==\"dinner\"){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_ext_sales_price;\nif(s==null){s=0}\n\t  \tfor each (date in store_sales.date){\n\t\t\tvar g=date.d_year;\n\t\t\tvar h=date.d_moy;}\n\t\t\tif (g==2001 && h==11){\n\t\t\tfor each (item in store_sales.item){\n\t\t\tvar b=item.i_manager_id;\n\t\t\tvar c=item.i_brand_id;\n\t\t\tvar d=item.i_brand;\n\t\t\t} \n\t\t\tif (b==1){\n\t\t\t   emit({i_brand:d,i_brand_id:c,hour:hour,minute:minute},s);\n\t \t}   \n   }}}}",
           "reduce": "_sum"
       }
   }
}

