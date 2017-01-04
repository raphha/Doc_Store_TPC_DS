xquery=
xquery version "1.0-ml";
<query6>{
  let $m := map:map()
  let $build :=
    for $sales in doc()[d_dom>=20 and d_dom<=21 and d_year>=1999 and d_year<=2001]/store_sales[(customer/hd_dep_count=4 or customer/hd_vehicle_count=2) and s_city="Midway"]
    let $c_last_name:= $sales/customer/c_last_name
    let $c_first_name:= $sales/customer/c_first_name
    let $ca_city:= $sales/customer/ca_city
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
