-- Threat: !InfrastructureShared
-- Name: 23878f31c8ae1
-- Type: 21

if pehdr.NumberOfSections == 3 and pesecs[1].PointerToRawData == 4096 then
  return mp.INFECTED
end
return mp.CLEAN
