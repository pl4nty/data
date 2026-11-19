-- Threat: !InfrastructureShared
-- Name: f0782669a8d7
-- Type: 21

if pehdr.NumberOfSections == 5 and pesecs[5].Name == ".idata" then
  return mp.INFECTED
end
return mp.CLEAN
