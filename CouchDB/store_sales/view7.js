{
   "language": "javascript",
   "views": {
       "q7": {
           "map": "function(doc) \n{\nvar s=doc.ss_ext_sales_price;\nif(s==null){s=0}\nfor each (time in doc.time){\nvar meal_time=time.t_meal_time;\nvar hour=time.t_hour;\nvar minute=time.t_minute;}\nif (meal_time==\"breakfast\" || meal_time==\"dinner\"){\n\t  \tfor each (date in doc.date){\n\t\t\tvar g=date.d_year;\n\t\t\tvar h=date.d_moy;}\n\t\t\tif (g==2001 && h==11){\n\t\t\tfor each (item in doc.item){\n\t\t\tvar b=item.i_manager_id;\n\t\t\tvar c=item.i_brand_id;\n\t\t\tvar d=item.i_brand;\n\t\t\t} \n\t\t\tif (b==1){\n\t\t\t   emit({i_brand:d,i_brand_id:c,hour:hour,minute:minute},s);\n\t \t}   \n   }}}",
           "reduce": "_sum"
       }
   }
}

