def scoop_update () {
	scoop status | 
	lines --skip-empty | 
	parse -r '(?<name>.*?)\s+(?<oldver>\d+\..*?)\s+(?<newver>\d+\..*)' | 
	each { 
		|line| 
		scoop update $line.name 
	}
}

