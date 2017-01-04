xquery=
xquery version "1.0-ml";
<query1>{
let $m := map:map()
let $build :=
let $q:=cts:and-query((
cts:element-range-query(xs:QName("i_manufact_id"), "=", 600),
cts:element-range-query(xs:QName("d_moy"), "=", 12)
))
for $tuple in cts:value-tuples(
(
cts:element-reference(xs:QName('d_year')),
cts:element-reference(xs:QName('i_brand_id')),
cts:element-reference(xs:QName('i_brand')),
cts:element-reference(xs:QName('ss_sales_price'))
),
("item-frequency", "frequency-order"), 
$q)
let $key := concat($tuple[1], ',', $tuple[2], ',', $tuple[3])
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:long($tuple[4]))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query1>, xdmp:elapsed-time()



