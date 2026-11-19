-- Threat: !InfrastructureShared
-- Name: 37783d548e0c
-- Type: 21

if pehdr.NumberOfSections == 3 and (pesecs[1].SizeOfRawData == 12288 or pesecs[1].SizeOfRawData == 16384) then
  return mp.INFECTED
end
return mp.CLEAN
