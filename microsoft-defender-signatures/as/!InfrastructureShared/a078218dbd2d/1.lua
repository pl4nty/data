-- Threat: !InfrastructureShared
-- Name: a078218dbd2d
-- Type: 21
-- Flags: 1

if pehdr.NumberOfSections == 3 and pesecs[2].VirtualSize == 2632 then
  return mp.INFECTED
end
return mp.CLEAN
