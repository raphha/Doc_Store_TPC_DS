xquery=
xquery version "1.0-ml";
<query9>{
  let $m := map:map()
  let $build :=
for $sales in cts:search(doc()/store_sales,
cts:and-query((
cts:path-range-query("/store_sales/time/t_hour", "=", 8),
cts:path-range-query("/store_sales/time/t_minute", ">=", 30),
cts:or-query((cts:and-query((
cts:path-range-query("/store_sales/customer/hd_dep_count", "=", 1),
cts:path-range-query("/store_sales/customer/hd_vehicle_count", "<=", 3)
)),cts:and-query((
cts:path-range-query("/store_sales/customer/hd_dep_count", "=", 2),
cts:path-range-query("/store_sales/customer/hd_vehicle_count", "<=", 4)
)),cts:and-query((
cts:path-range-query("/store_sales/customer/hd_dep_count", "=", 3),
cts:path-range-query("/store_sales/customer/hd_vehicle_count", "<=", 5)
)))),
cts:path-range-query("/store_sales/s_store_name", "=", "ese")
))
)
    let $key := "count"
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:float(1))))
  for $key in map:keys($m)
  return
  <group>{concat($key,':',map:get($m, $key))}</group>
}</query9>, xdmp:elapsed-time()
