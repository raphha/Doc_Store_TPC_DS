xquery=
xquery version "1.0-ml";
<query11>{
  let $m := map:map()
  let $build :=
    for $sales in doc()[t_hour=12 and t_minute>=30]/store_sales[s_store_name="ese" and customer/hd_dep_count=3]
    let $key := "count"
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:float(1))))
  for $key in map:keys($m)
  return
  <group>{concat($key,':',map:get($m, $key))}</group>
}</query11>, xdmp:elapsed-time()
