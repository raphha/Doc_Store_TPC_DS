xquery=
xquery version "1.0-ml";
<query10>{
  let $m := map:map()
  let $build :=
    for $sales in doc()/store_sales[(((item/i_category="Music" or item/i_category="Home" or item/i_category="Sports") and (item/i_class="country" or item/i_class="rugs" or item/i_class="fishing")) or ((item/i_category="Women" or item/i_category="Men" or item/i_category="Children") and (item/i_class="swimwear" or item/i_class="shirts" or item/i_class="pants"))) and date/d_year=2000]
    let $i_brand:= $sales/item/i_brand
    let $s_company_name:= $sales/s_company_name
    let $i_category:= $sales/item/i_category
    let $i_class:= $sales/item/i_class
    let $d_moy:= $sales/date/d_moy
    let $s_store_name:= $sales/s_store_name
    let $key := concat($i_category, ',', $i_class, ',', $i_brand, ',', $s_store_name, ',', $s_company_name, ',', $d_moy)
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:float($sales/ss_ext_sales_price))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query10>, xdmp:elapsed-time()
