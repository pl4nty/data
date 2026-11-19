-- Threat: !InfrastructureShared
-- Name: a578c7031b7f
-- Type: 21

if peattributes.x86_image and pesecs[pehdr.NumberOfSections].Characteristics == 3758096448 or pesecs[pehdr.NumberOfSections].Characteristics == 3791650880 or pesecs[pehdr.NumberOfSections].Characteristics == 3761242176 or pesecs[pehdr.NumberOfSections].Characteristics == 3794796608 or pesecs[pehdr.NumberOfSections].Characteristics == 3758096480 or pesecs[pehdr.NumberOfSections].Characteristics == 3758096416 or pesecs[pehdr.NumberOfSections].Characteristics == 3791650816 then
  return mp.INFECTED
end
return mp.CLEAN
