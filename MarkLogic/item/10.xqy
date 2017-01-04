xquery=
xquery version "1.0-ml";
<query10>{
  let $m := map:map()
  let $build :=
    for $sales in doc()[((i_category="Music" or i_category="Home" or i_category="Sports") and (i_class="country" or i_class="rugs" or i_class="fishing")) or ((i_category="Women" or i_category="Men" or i_category="Children") and (i_class="swimwear" or i_class="shirts" or i_class="pants"))]/store_sales[date/d_year=2000]
    let $i_brand:= doc()/i_brand
    let $s_company_name:= $sales/s_company_name
    let $i_category:= doc()/i_category
    let $i_class:= doc()/i_class
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
