xquery=
xquery version "1.0-ml";
<query2>{
  let $m := map:map()
  let $build :=
for $sales in cts:search(doc()/store_sales,
cts:and-query((
cts:path-range-query("/store_sales/item/i_current_price", ">", 9),
cts:path-range-query("/store_sales/date/d_year", "=", 2001)
))
)
    let $key := $sales/customer/ca_state
    let $s := 1
    return map:put(
      $m, $key, sum((
        map:get($m, $key), $s)))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query2>, xdmp:elapsed-time()
