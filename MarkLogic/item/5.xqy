xquery=
xquery version "1.0-ml";
<query5>{
  let $m := map:map()
  let $build :=
    for $sales in doc()[(i_category="Music" or i_category="Home" or i_category="Sports")]/store_sales[date/d_month_seq>=1200 and date/d_month_seq<=1211]
    let $i_item_id:= doc()/i_item_id
    let $i_item_desc:= doc()/i_item_desc
    let $i_category:= doc()/i_category
    let $i_class:= doc()/i_class
    let $i_current_price:= doc()/i_current_price
    let $key := concat($i_item_id, ',', $i_item_desc, ',', $i_category, ',', $i_class, ',', $i_current_price)
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:float($sales/ss_ext_sales_price))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query5>, xdmp:elapsed-time()
