xquery=
xquery version "1.0-ml";
<query9>{
  let $m := map:map()
  let $build :=
    for $sales in doc()[t_hour=8 and t_minute>=30]/store_sales[((customer/hd_dep_count=1 and customer/hd_vehicle_count<=3) or (customer/hd_dep_count=2 and customer/hd_vehicle_count<=4) or (customer/hd_dep_count=3 and customer/hd_vehicle_count<=5)) and s_store_name="ese"]
    let $key := "count"
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:float(1))))
  for $key in map:keys($m)
  return
  <group>{concat($key,':',map:get($m, $key))}</group>
}</query9>, xdmp:elapsed-time()
