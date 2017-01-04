{
   "language": "javascript",
   "views": {
       "q5": {
           "map": "function(doc) \n{\nvar g=doc.d_month_seq;\nif (g>=1200 && g<=1211){ \nfor each (store_sales in doc.store_sales) {\nvar s=store_sales.ss_ext_sales_price;\nif(s==null){s=0}\n\t  \tfor each (item in store_sales.item){\n\t\t\t var item_id=item.i_item_id;\n\t\t\t var item_desc=item.i_item_desc;\n\t\t\t var category=item.i_category;\n\t\t\t var class=item.i_class;\n\t\t\t var price=item.i_current_price;}\n\t\t\t if(category==\"Music\" || category==\"Home\" || category==\"Sports\"){\n\t\t\t   emit({item_id:item_id,item_desc:item_desc, category:category, class:class, current_price:price},s);\n\t \t}   \n   }}} ",
           "reduce": "_sum"
       }
   }
}

