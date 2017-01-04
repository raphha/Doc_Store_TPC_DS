{
   "language": "javascript",
   "views": {
       "q12": {
           "map": "function(doc) \n{\n var item_id=doc.i_item_id;\n var item_desc=doc.i_item_desc;\n var category=doc.i_category;\n var class=doc.i_class;\n var price=doc.i_current_price;\n  if(category==\"Music\" || category==\"Home\" || category==\"Sports\"){\n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_ext_sales_price;\nif(s==null){s=0}\n\t  \tfor each (date in store_sales.date){\n\t\t\tvar g=date.d_date;}\n\t\t\tif (g>=\"2002-01-01\" && g<=\"2002-01-31\"){\n\t\t\t   emit({item_id:item_id,item_desc:item_desc, category:category, class:class, current_price:price},s);\n\t \t}   \n   }}} ",
           "reduce": "_sum"
       }
   }
}