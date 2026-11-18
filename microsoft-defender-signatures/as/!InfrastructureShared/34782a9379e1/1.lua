-- Threat: !InfrastructureShared
-- Name: 34782a9379e1
-- Type: 21

if pehdr.NumberOfSections > 3 and pesecs[2].PointerToRawData - pesecs[1].SizeOfRawData >= 12288 then
  return mp.INFECTED
end
return mp.CLEAN
