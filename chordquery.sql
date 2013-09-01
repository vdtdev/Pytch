with 
	part1 as 
		(select distinct on("type",root)
			root as ar,
			third as a3,
			fifth as a5 
		from 
			chords 
		where 
			/*root = 'A' and */
			"type" = 'minor')
	,
	part2 as
		(select distinct on (ar)
			(select "MNoteValue"(cast(ar as text))) as br,
			(select "MNoteValue"(cast(a3 as text))) as b3,
			(select "MNoteValue"(cast(a5 as text))) as b5 from part1)
		
	
	select distinct on (part1.ar )
		part1.ar as "Root", 
		(part2.b3-part2.br) as "DR_3", 
		(part2.b5-part2.b3)%8 as "D5_3",
		part2.br,
		part2.b3,
		part2.b5
	from 
		part2,
		part1
