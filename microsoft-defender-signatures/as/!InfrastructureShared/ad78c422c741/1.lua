-- Threat: !InfrastructureShared
-- Name: ad78c422c741
-- Type: 21

if pehdr.NumberOfSections == 10 and pesecs[6].Name == "43B" then
  return mp.INFECTED
end
return mp.CLEAN
