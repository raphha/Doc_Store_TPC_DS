xquery=
xquery version "1.0-ml";
<query6>{
  let $m := map:map()
  let $build :=
for $doc in cts:search(doc(),
cts:and-query((cts:or-query((
cts:json-property-range-query("hd_dep_count", "=", 4),
cts:json-property-range-query("hd_vehicle_count", "=", 2)
)),
cts:path-range-query("/store_sales/date/d_dom", ">=", 20),
cts:path-range-query("/store_sales/date/d_dom", "<=", 21),
cts:path-range-query("/store_sales/date/d_year", ">=", 1999),
cts:path-range-query("/store_sales/date/d_year", "<=", 2001),
cts:path-range-query("/store_sales/s_city", "=", "Midway")
))
)
    for $sales in $doc/store_sales[date/d_dom>=20 and date/d_dom<=21 and date/d_year>=1999 and date/d_year<=2001 and s_city="Midway"]
    let $c_last_name:= $doc/c_last_name
    let $c_first_name:= $doc/c_first_name
    let $ca_city:= $doc/ca_city
    let $ss_ticket_number:= $sales/ss_ticket_number
    let $key := concat($c_last_name, ';', $c_first_name, ';', $ca_city, ';', $ss_ticket_number)
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:float($sales/ss_ext_sales_price))))
  for $key in map:keys($m)
  return
  <group>{concat($key,';',map:get($m, $key))}</group>
}</query6>, xdmp:elapsed-time()
