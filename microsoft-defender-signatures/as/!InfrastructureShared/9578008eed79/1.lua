-- Threat: !InfrastructureShared
-- Name: 9578008eed79
-- Type: 21
-- Flags: 1

if mp.getfilesize() > 40960 or pehdr.NumberOfSections > 4 then
  return mp.LOWFI
end
return mp.INFECTED
