{
   "language": "javascript",
   "views": {
       "q12": {
           "map": "function(doc) \n{ \n   for each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_ext_sales_price;\nif(s==null){s=0}\nfor each (item in store_sales.item){\n var item_id=item.i_item_id;\n var item_desc=item.i_item_desc;\n var category=item.i_category;\n var class=item.i_class;\n var price=item.i_current_price;}\n if(category==\"Music\" || category==\"Home\" || category==\"Sports\"){\n\t  \tfor each (date in store_sales.date){\n\t\t\tvar g=date.d_date;}\n\t\t\tif (g>=\"2002-01-01\" && g<=\"2002-01-31\"){\n\t\t\t   emit({item_id:item_id,item_desc:item_desc, category:category, class:class, current_price:price},s);\n\t \t}   \n   }}} ",
           "reduce": "_sum"
       }
   }
}
