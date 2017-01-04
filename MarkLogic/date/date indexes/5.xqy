xquery=
xquery version "1.0-ml";
<query5>{
  let $m := map:map()
  let $build :=
for $doc in cts:search(doc(),
cts:and-query((
cts:path-range-query("/store_sales/item/i_category", "=", ("Music","Home","Sports")),
cts:json-property-range-query("d_month_seq", ">=", 1200),
cts:json-property-range-query("d_month_seq", "<=", 1211)
))
)
    for $sales in $doc/store_sales[item/i_category=("Music","Home","Sports")]
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
}</query5>, xdmp:elapsed-time()
