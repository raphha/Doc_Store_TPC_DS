xquery=
xquery version "1.0-ml";
<query3>{
  let $m := map:map()
  let $build :=
    for $sales in doc()[i_manager_id=20]/store_sales[date/d_moy=11 and date/d_year=2001 and customer/ca_zip="35709"]
    let $i_manufact_id:= doc()/i_manufact_id
    let $i_manufact:= doc()/i_manufact
    let $i_brand_id:= doc()/i_brand_id
    let $i_brand:= doc()/i_brand
    let $key := concat($i_brand_id, ',', $i_brand, ',', $i_manufact_id, ',', $i_manufact)
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:long($sales/ss_ext_sales_price))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query3>, xdmp:elapsed-time()
