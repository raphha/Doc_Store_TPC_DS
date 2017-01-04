xquery=
xquery version "1.0-ml";
<query10>{
let $m := map:map()
let $build :=
let $q:=cts:and-query((
cts:element-range-query(xs:QName("d_year"), "=", 2000),
cts:or-query((
cts:and-query((
cts:element-range-query(xs:QName("i_category"), "=", ("Music","Home","Sports")),
cts:element-range-query(xs:QName("i_class"), "=", ("country","rugs","fishing"))
)),
cts:and-query((
cts:element-range-query(xs:QName("i_category"), "=", ("Women","Men","Children")),
cts:element-range-query(xs:QName("i_class"), "=", ("swimwear","shirts","pants"))
))
))
))
for $tuple in cts:value-tuples(
(
cts:element-reference(xs:QName('i_category')),
cts:element-reference(xs:QName('i_class')),
cts:element-reference(xs:QName('i_brand')),
cts:element-reference(xs:QName('s_store_name')),
cts:element-reference(xs:QName('s_company_name')),
cts:element-reference(xs:QName('d_moy')),
cts:element-reference(xs:QName('ss_sales_price'))
),
("item-frequency", "frequency-order"), 
$q)
let $key := concat($tuple[1], ',', $tuple[2], ',', $tuple[3], ',', $tuple[4], ',', $tuple[5], ',', $tuple[6])
    return map:put(
      $m, $key, sum((
        map:get($m, $key), $tuple[7])))
  for $key in map:keys($m)
  return
  <group>{concat($key,',',map:get($m, $key))}</group>
}</query10>, xdmp:elapsed-time()
