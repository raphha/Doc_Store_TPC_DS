xquery=
xquery version "1.0-ml";
<query2>{
let $m := map:map()
let $build :=
let $q:=cts:and-query((
cts:element-range-query(xs:QName("d_year"), "=", 2001),
cts:element-range-query(xs:QName("i_current_price"), ">", 9)
))
for $tuple in cts:value-tuples(
(
cts:element-reference(xs:QName('ca_state'))
),
("item-frequency", "frequency-order"), 
$q)
let $key := $tuple[1]
let $s := 1
    return map:put(
      $m, $key, sum((
        map:get($m, $key),$s)))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query2>, xdmp:elapsed-time()
