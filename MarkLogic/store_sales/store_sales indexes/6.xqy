xquery=
xquery version "1.0-ml";
<query6>{
let $m := map:map()
let $build :=
let $q:=cts:and-query((
cts:element-range-query(xs:QName("d_dom"), ">=", 20),
cts:element-range-query(xs:QName("d_dom"), "<=", 21),
cts:element-range-query(xs:QName("d_year"), ">=", 1999),
cts:element-range-query(xs:QName("d_year"), "<=", 2001),
cts:element-range-query(xs:QName("s_city"), "=", "Midway"),
cts:or-query((
cts:element-range-query(xs:QName("hd_dep_count"), "=", 4),
cts:element-range-query(xs:QName("hd_vehicle_count"), "=", 2)))
))
for $tuple in cts:value-tuples(
(
cts:element-reference(xs:QName('c_last_name')),
cts:element-reference(xs:QName('c_first_name')),
cts:element-reference(xs:QName('ca_city')),
cts:element-reference(xs:QName('ss_ticket_number')),
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
}</query6>, xdmp:elapsed-time()
