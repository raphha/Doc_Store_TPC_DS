xquery=
xquery version "1.0-ml";
<query7>{
  let $m := map:map()
  let $build :=
for $doc in cts:search(doc(),
cts:and-query((
cts:path-range-query("/store_sales/item/i_manager_id", "=", 1),
cts:path-range-query("/store_sales/date/d_year", "=", 2001),
cts:path-range-query("/store_sales/date/d_moy", "=", 11),
cts:or-query((
cts:json-property-range-query("t_meal_time", "=", "breakfast"),
cts:json-property-range-query("t_meal_time", "=", "dinner")))
))
)
    for $sales in $doc/store_sales[item/i_manager_id=1 and date/d_moy=11 and date/d_year=2001]
    let $t_hour:= $doc/t_hour
    let $t_minute:= $doc/t_minute
    let $i_brand_id:= $sales/item/i_brand_id
    let $i_brand:= $sales/item/i_brand
    let $key := concat($i_brand_id, ';', $i_brand, ';', $t_hour, ';', $t_minute)
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:float($sales/ss_ext_sales_price))))
  for $key in map:keys($m)
  return
  <group>{concat($key,';',map:get($m, $key))}</group>
}</query7>, xdmp:elapsed-time()
