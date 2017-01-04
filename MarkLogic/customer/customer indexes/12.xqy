xquery=
xquery version "1.0-ml";
<query12>{
  let $m := map:map()
  let $build :=
for $sales in cts:search(doc()/store_sales,
cts:and-query((
cts:path-range-query("/store_sales/item/i_category", "=", ("Music","Home","Sports")),
cts:path-range-query("/store_sales/date/d_date", ">=", "2002-01-01"),
cts:path-range-query("/store_sales/date/d_date", "<=", "2002-01-31")
))
)
    let $i_item_id:= $sales/item/i_item_id
    let $i_item_desc:= $sales/item/i_item_desc
    let $i_category:= $sales/item/i_category
    let $i_class:= $sales/item/i_class
    let $i_current_price:= $sales/item/i_current_price
    let $key := concat($i_item_id, ',', $i_item_desc, ',', $i_category, ',', $i_class, ',', $i_current_price)
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:float($sales/ss_ext_sales_price))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query12>, xdmp:elapsed-time()
