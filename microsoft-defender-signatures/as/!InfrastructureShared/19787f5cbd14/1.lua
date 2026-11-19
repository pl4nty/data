-- Threat: !InfrastructureShared
-- Name: 19787f5cbd14
-- Type: 21

if pehdr.NumberOfSections == 10 and pesecs[6].Name == "WET_J" then
  return mp.INFECTED
end
return mp.CLEAN
