xquery=
xquery version "1.0-ml";
<query7>{
let $m := map:map()
let $build :=
let $q:=cts:and-query((
cts:element-range-query(xs:QName("i_manager_id"), "=", 1),
cts:element-range-query(xs:QName("d_moy"), "=", 11),
cts:element-range-query(xs:QName("d_year"), "=", 2001),
cts:element-range-query(xs:QName("t_meal_time"), "=", ("breakfast","dinner"))
))
for $tuple in cts:value-tuples(
(
cts:element-reference(xs:QName('i_brand_id')),
cts:element-reference(xs:QName('i_brand')),
cts:element-reference(xs:QName('t_hour')),
cts:element-reference(xs:QName('t_minute')),
cts:element-reference(xs:QName('ss_ext_sales_price'))

),
("item-frequency", "frequency-order"), 
$q)
let $key := concat($tuple[1], ',', $tuple[2], ',', $tuple[3], ',', $tuple[4])
    return map:put(
      $m, $key, sum((
        map:get($m, $key),xs:float($tuple[5]))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query7>, xdmp:elapsed-time()
