-- Threat: !InfrastructureShared
-- Name: 6d7828592808
-- Type: 21

if pehdr.NumberOfSections == 9 and pesecs[8].Characteristics == 1744830560 then
  return mp.INFECTED
end
return mp.CLEAN
