xquery=
xquery version "1.0-ml";
<query8>{
  let $m := map:map()
  let $build :=
for $doc in cts:search(doc(),
cts:and-query((cts:or-query((
cts:json-property-range-query("hd_dep_count", "=", 5),
cts:json-property-range-query("hd_vehicle_count", ">", 2)
)),
cts:path-range-query("/store_sales/date/d_dow", "=", 1),
cts:path-range-query("/store_sales/date/d_year", ">=", 1998),
cts:path-range-query("/store_sales/date/d_year", "<=", 2000),
cts:path-range-query("/store_sales/s_number_employees", ">=", 200),
cts:path-range-query("/store_sales/s_number_employees", "<=", 295)
))
)
    for $sales in $doc/store_sales[date/d_dow=1 and date/d_year>=1998 and date/d_year<=2000 and s_number_employees>=200 and s_number_employees<=295]
    let $c_customer_sk:= $doc/c_customer_sk
    let $ss_ticket_number:= $sales/ss_ticket_number
    let $s_city:= $sales/s_city
    let $key := concat($ss_ticket_number, ';', $c_customer_sk, ';', $s_city)
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:float($sales/ss_coupon_amt))))
  for $key in map:keys($m)
  return
  <group>{concat($key,';',map:get($m, $key))}</group>
}</query8>, xdmp:elapsed-time()
