xquery=
xquery version "1.0-ml";
<query4>{
let $m := map:map()
let $build :=
let $q:=cts:and-query((
cts:element-range-query(xs:QName("cd_gender"), "=", "F"),
cts:element-range-query(xs:QName("cd_marital_status"), "=", "S"),
cts:element-range-query(xs:QName("cd_education_status"), "=", "Secondary"),
cts:element-range-query(xs:QName("d_year"), "=", 2001),
cts:element-range-query(xs:QName("s_state"), "=", "TN")
))
for $tuple in cts:value-tuples(
(
cts:element-reference(xs:QName('i_item_id')),
cts:element-reference(xs:QName('s_state')),
cts:element-reference(xs:QName('ss_sales_price'))
),
("item-frequency", "frequency-order"), 
$q)
let $key := concat($tuple[1], ',', $tuple[2])
    return map:put(
      $m, $key, sum((
        map:get($m, $key),xs:long($tuple[3]))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query4>, xdmp:elapsed-time()
