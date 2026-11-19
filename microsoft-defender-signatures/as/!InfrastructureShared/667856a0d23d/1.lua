-- Threat: !InfrastructureShared
-- Name: 667856a0d23d
-- Type: 21
-- Flags: 1

if pehdr.NumberOfSections == 12 and pesecs[9].VirtualSize == 13320 then
  return mp.INFECTED
end
return mp.CLEAN
