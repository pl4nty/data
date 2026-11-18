-- Threat: !InfrastructureShared
-- Name: 3540e9bcd8b8
-- Type: 21

if pehdr.NumberOfSections >= 4 and pehdr.NumberOfSections <= 8 and pesecs[1].VirtualAddress == 4096 then
  return mp.INFECTED
end
return mp.CLEAN
