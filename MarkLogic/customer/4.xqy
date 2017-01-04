xquery=
xquery version "1.0-ml";
<query4>{
  let $m := map:map()
  let $build :=
    for $sales in doc()[cd_gender="F" and cd_marital_status="S" and cd_education_status="Secondary"]/store_sales[s_state="TN" and date/d_year=2001]
    let $i_item_id:= $sales/item/i_item_id
    let $s_state:= $sales/s_state
    let $key := concat($i_item_id, ',', $s_state)
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:long($sales/ss_sales_price))))
  for $key at $count in subsequence(map:keys($m), 1, 100)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query4>, xdmp:elapsed-time()
