-- Threat: !InfrastructureShared
-- Name: 7e782f3040b2
-- Type: 21

if peattributes.amd64_image and pesecs[pehdr.NumberOfSections].Characteristics == 3758096448 or pesecs[pehdr.NumberOfSections].Characteristics == 3791650880 or pesecs[pehdr.NumberOfSections].Characteristics == 3761242176 then
  return mp.INFECTED
end
return mp.CLEAN
