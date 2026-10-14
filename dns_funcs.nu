def get_bimi_from_domain ($domain) { 
   let dns_res = (dns query --type [txt] $"default._bimi.($domain)")
   $dns_res.header.answer_count
   if $dns_res.header.answer_count.0 > 0 {
   	let dns_res_data =  $dns_res.answer.0.rdata.0  | first
	$dns_res_data
	let bimi_url = ($dns_res_data | split row ';' | str trim  |  parse "{key}={value}" | transpose -r -d | get l  ) 
	$bimi_url
	print $"bimi report found, opening ($bimi_url)"
        start $bimi_url
   } else { print "no bimi _default record"
   }
}
