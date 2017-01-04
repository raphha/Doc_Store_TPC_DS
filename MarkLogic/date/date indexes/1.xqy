xquery=
xquery version "1.0-ml";
<query1>{
  let $m := map:map()
  let $build :=
for $doc in cts:search(doc(),
cts:and-query((
cts:path-range-query("/store_sales/item/i_manufact_id", "=", 600),
cts:json-property-range-query("d_moy", "=", 12)
))
)
    for $sales in $doc/store_sales[item/i_manufact_id=600]
    let $d_year:= $doc/d_year
    let $i_brand_id:= $sales/item/i_brand_id
    let $i_brand:= $sales/item/i_brand
    let $key := concat($d_year, ',', $i_brand_id, ',', $i_brand)
    return map:put(
      $m, $key, sum((
        map:get($m, $key),
        xs:long($sales/ss_sales_price))))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query1>, xdmp:elapsed-time()
