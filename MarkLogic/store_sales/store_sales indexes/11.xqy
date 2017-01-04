xquery=
xquery version "1.0-ml";
<query11>{
let $m := map:map()
let $build :=
let $q:=cts:and-query((
cts:element-range-query(xs:QName("t_hour"), "=", 12),
cts:element-range-query(xs:QName("t_minute"), ">=", 30),
cts:element-range-query(xs:QName("s_store_name"), "=", "ese"),
cts:element-range-query(xs:QName("hd_dep_count"), "=", 3)
))
for $tuple in cts:value-tuples(
(
cts:element-reference(xs:QName('i_item_id')),
cts:element-reference(xs:QName('ss_ticket_number'))
),
("item-frequency", "frequency-order"), 
$q)
let $key := "count"
    return map:put(
      $m, $key, sum((
        map:get($m, $key),xs:float(1))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query11>, xdmp:elapsed-time()
