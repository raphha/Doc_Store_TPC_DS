{
   "language": "javascript",
   "views": {
       "q7": {
           "map": "function(doc) \n{ \n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_ext_sales_price;\nif(s==null){s=0}\nfor each (item in store_sales.item){\n var b=item.i_manager_id;\nvar c=item.i_brand_id;\nvar d=item.i_brand;} \n\tif (b==1){\n\t  \tfor each (date in store_sales.date){\n\t\t\tvar g=date.d_year;\n\t\t\tvar h=date.d_moy;}\n\t\t\tif (g==2001 && h==11){\n\t\t\tfor each (time in store_sales.time){\n\t\t\tvar meal_time=time.t_meal_time;\n\t\t\tvar hour=time.t_hour;\n\t\t\tvar minute=time.t_minute;} \n\t\t\tif (meal_time==\"breakfast\" || meal_time==\"dinner\"){\n\t\t\t   emit({i_brand:d,i_brand_id:c,hour:hour,minute:minute},s);\n\t \t}   \n   }}}}",
           "reduce": "_sum"
       }
   }
}

