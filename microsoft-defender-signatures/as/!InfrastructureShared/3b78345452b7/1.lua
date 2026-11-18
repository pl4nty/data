-- Threat: !InfrastructureShared
-- Name: 3b78345452b7
-- Type: 21

if pesecs[pehdr.NumberOfSections].SizeOfRawData == 0 then
  return mp.INFECTED
end
return mp.CLEAN
