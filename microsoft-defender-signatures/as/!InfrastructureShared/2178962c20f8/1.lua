-- Threat: !InfrastructureShared
-- Name: 2178962c20f8
-- Type: 21

if pehdr.NumberOfSections == 10 and pesecs[9].PointerToRawData == 1536 and pehdr.Machine == 332 and pehdr.Subsystem == 2 then
  return mp.INFECTED
end
return mp.CLEAN
