xquery=
xquery version "1.0-ml";
<query12>{
  let $m := map:map()
  let $build :=
for $doc in cts:search(doc(),
cts:and-query((
cts:json-property-range-query("i_category", "=", ("Music","Home","Sports")),
cts:path-range-query("/store_sales/date/d_date", ">=", "2002-01-01"),
cts:path-range-query("/store_sales/date/d_date", "<=", "2002-01-31")
))
)
    for $sales in $doc/store_sales[date/d_date>="2002-01-01" and date/d_date<="2002-01-31"]
    let $i_item_id:= $doc/i_item_id
    let $i_item_desc:= $doc/i_item_desc
    let $i_category:= $doc/i_category
    let $i_class:= $doc/i_class
    let $i_current_price:= $doc/i_current_price
    let $key := concat($i_item_id, ',', $i_item_desc, ',', $i_category, ',', $i_class, ',', $i_current_price)
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:float($sales/ss_ext_sales_price))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query12>, xdmp:elapsed-time()
