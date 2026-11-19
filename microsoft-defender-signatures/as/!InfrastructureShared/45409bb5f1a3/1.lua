-- Threat: !InfrastructureShared
-- Name: 45409bb5f1a3
-- Type: 21

if pehdr.NumberOfSections > 6 and pesecs[pehdr.NumberOfSections].Name == ".config" then
  return mp.INFECTED
end
return mp.CLEAN
