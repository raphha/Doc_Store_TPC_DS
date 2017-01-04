xquery=
xquery version "1.0-ml";
<query9>{
  let $m := map:map()
  let $build :=
for $doc in cts:search(doc(),
cts:and-query((
cts:or-query((cts:and-query((
cts:json-property-range-query("hd_dep_count", "=", 1),
cts:json-property-range-query("hd_vehicle_count", "<=", 3)
)),cts:and-query((
cts:json-property-range-query("hd_dep_count", "=", 2),
cts:json-property-range-query("hd_vehicle_count", "<=", 4)
)),cts:and-query((
cts:json-property-range-query("hd_dep_count", "=", 3),
cts:json-property-range-query("hd_vehicle_count", "<=", 5)
)))),
cts:path-range-query("/store_sales/time/t_hour", "=", 8),
cts:path-range-query("/store_sales/time/t_minute", ">=", 30),
cts:path-range-query("/store_sales/s_store_name", "=", "ese")
))
)
    for $sales in $doc/store_sales[time/t_hour=8 and time/t_minute>=30 and s_store_name="ese"]
    let $key := "count"
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:float(1))))
  for $key in map:keys($m)
  return
  <group>{concat($key,':',map:get($m, $key))}</group>
}</query9>, xdmp:elapsed-time()
