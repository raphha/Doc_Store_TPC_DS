xquery=
xquery version "1.0-ml";
<query2>{
  let $m := map:map()
  let $build :=
for $doc in cts:search(doc(),
cts:and-query((
cts:path-range-query("/store_sales/item/i_current_price", ">", 9),
cts:json-property-range-query("d_year", "=", 2001)
))
)
    for $sales in $doc/store_sales[item/i_current_price>9]
    let $key := $sales/customer/ca_state
    let $s := 1
    return map:put(
      $m, $key, sum((
        map:get($m, $key), $s)))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query2>, xdmp:elapsed-time()
