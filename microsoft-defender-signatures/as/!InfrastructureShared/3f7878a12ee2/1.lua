-- Threat: !InfrastructureShared
-- Name: 3f7878a12ee2
-- Type: 21

if pehdr.NumberOfSections == 7 and pesecs[4].Name == ".fuckyou" and pesecs[5].Name == ".fuckyou" and pesecs[6].Name == ".fuckyou" then
  return mp.INFECTED
end
return mp.CLEAN
