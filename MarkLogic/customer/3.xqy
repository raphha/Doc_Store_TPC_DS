xquery=
xquery version "1.0-ml";
<query3>{
  let $m := map:map()
  let $build :=
    for $sales in doc()[ca_zip="35709"]/store_sales[item/i_manager_id=20 and date/d_moy=11 and date/d_year=2001]
    let $i_manufact_id:= $sales/item/i_manufact_id
    let $i_manufact:= $sales/item/i_manufact
    let $i_brand_id:= $sales/item/i_brand_id
    let $i_brand:= $sales/item/i_brand
    let $key := concat($i_brand_id, ',', $i_brand, ',', $i_manufact_id, ',', $i_manufact)
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:long($sales/ss_ext_sales_price))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query3>, xdmp:elapsed-time()
