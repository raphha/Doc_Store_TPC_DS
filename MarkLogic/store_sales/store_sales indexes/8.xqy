xquery=
xquery version "1.0-ml";
<query8>{
let $m := map:map()
let $build :=
let $q:=cts:and-query((
cts:element-range-query(xs:QName("d_dow"), "=", 1),
cts:element-range-query(xs:QName("d_year"), ">=", 1998),
cts:element-range-query(xs:QName("d_year"), "<=", 2000),
cts:element-range-query(xs:QName("s_number_employees"), ">=", 200),
cts:element-range-query(xs:QName("s_number_employees"), "<=", 295),
cts:or-query((
cts:element-range-query(xs:QName("hd_dep_count"), "=", 5),
cts:element-range-query(xs:QName("hd_vehicle_count"), ">", 2)))
))
for $tuple in cts:value-tuples(
(
cts:element-reference(xs:QName('ss_ticket_number')),
cts:element-reference(xs:QName('c_customer_sk')),
cts:element-reference(xs:QName('s_city')),
cts:element-reference(xs:QName('ss_coupon_amt'))

),
("item-frequency", "frequency-order"), 
$q)
let $key := concat($tuple[1], ',', $tuple[2], ',', $tuple[3])
    return map:put(
      $m, $key, sum((
        map:get($m, $key),xs:float($tuple[4]))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query8>, xdmp:elapsed-time()
