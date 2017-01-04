xquery=
xquery version "1.0-ml";
<query8>{
  let $m := map:map()
  let $build :=
    for $sales in doc()/store_sales[date/d_dow=1 and date/d_year>=1998 and date/d_year<=2000 and s_number_employees>=200 and s_number_employees<=295 and (customer/hd_dep_count=5 or customer/hd_vehicle_count>2)]
    let $c_customer_sk:= $sales/customer/c_customer_sk
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
