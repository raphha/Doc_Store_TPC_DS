{
   "language": "javascript",
   "views": {
       "q7": {
           "map": "function(doc) \n{ \nvar g=doc.d_year;\nvar h=doc.d_moy;\nif (g==2001 && h==11){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_ext_sales_price;\nif(s==null){s=0}\n\t  \tfor each (item in store_sales.item){\n\t\t\tvar b=item.i_manager_id;\n\t\t\tvar c=item.i_brand_id;\n\t\t\tvar d=item.i_brand;}\n\t\t\tif (b==1){\n\t\t\tfor each (time in store_sales.time){\n\t\t\tvar meal_time=time.t_meal_time;\n\t\t\tvar hour=time.t_hour;\n\t\t\tvar minute=time.t_minute;} \n\t\t\tif (meal_time==\"breakfast\" || meal_time==\"dinner\"){\n\t\t\t   emit({i_brand:d,i_brand_id:c,hour:hour,minute:minute},s);\n\t \t}   \n   }}}}",
           "reduce": "_sum"
       }
   }
}

