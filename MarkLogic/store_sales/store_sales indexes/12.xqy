xquery=
xquery version "1.0-ml";
<query12>{
let $m := map:map()
let $build :=
let $q:=cts:and-query((
cts:element-range-query(xs:QName("i_category"), "=", ("Music","Home","Sports")),
cts:element-range-query(xs:QName("d_date"), ">=", "2002-01-01"),
cts:element-range-query(xs:QName("d_date"), "<=", "2002-01-31")
))
for $tuple in cts:value-tuples(
(
cts:element-reference(xs:QName('i_item_id')),
cts:element-reference(xs:QName('i_item_desc')),
cts:element-reference(xs:QName('i_category')),
cts:element-reference(xs:QName('i_class')),
cts:element-reference(xs:QName('i_current_price')),
cts:element-reference(xs:QName('ss_ext_sales_price'))

),
("item-frequency", "frequency-order"), 
$q)
let $key := concat($tuple[1], ',', $tuple[2], ',', $tuple[3], ',', $tuple[4], ',', $tuple[5])
    return map:put(
      $m, $key, sum((
        map:get($m, $key),xs:long($tuple[6]))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query12>, xdmp:elapsed-time()
