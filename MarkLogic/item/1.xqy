xquery=
xquery version "1.0-ml";
<query1>{
  let $m := map:map()
  let $build :=
    for $sales in doc()[i_manufact_id=600]/store_sales[date/d_moy=12]
    let $d_year:= $sales/date/d_year
    let $i_brand_id:= doc()/i_brand_id
    let $i_brand:= doc()/i_brand
    let $key := concat($d_year, ',', $i_brand_id, ',', $i_brand)
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:long($sales/ss_sales_price))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query1>, xdmp:elapsed-time()
