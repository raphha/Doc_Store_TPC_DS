xquery=
xquery version "1.0-ml";
<query10>{
  let $m := map:map()
  let $build :=
for $doc in cts:search(doc(),
cts:and-query((
cts:or-query((cts:and-query((
cts:path-range-query("/store_sales/item/i_category", "=", ("Music","Home","Sports")),
cts:path-range-query("/store_sales/item/i_class", "=", ("country","rugs","fishing"))
)),cts:and-query((
cts:path-range-query("/store_sales/item/i_category", "=", ("Women","Men","Children")),
cts:path-range-query("/store_sales/item/i_class", "=", ("swimwear","shirts","pants"))
)))),
cts:json-property-range-query("d_year", "=", 2000)
))
)
    for $sales in $doc/store_sales[((item/i_category=("Music","Home","Sports") and item/i_class=("country","rugs","fishing")) or (item/i_category=("Women","Men","Children") and item/i_class=("swimwear","shirts","pants")))]
    let $i_brand:= $sales/item/i_brand
    let $s_company_name:= $sales/s_company_name
    let $i_category:= $sales/item/i_category
    let $i_class:= $sales/item/i_class
    let $d_moy:= $doc/d_moy
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
