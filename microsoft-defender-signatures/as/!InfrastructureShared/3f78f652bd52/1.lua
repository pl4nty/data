-- Threat: !InfrastructureShared
-- Name: 3f78f652bd52
-- Type: 21

if pehdr.NumberOfSections == 5 and pesecs[1].Name == "AUTO" and pesecs[2].Name == "DGROUP" then
  return mp.INFECTED
end
return mp.CLEAN
