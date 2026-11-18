-- Threat: !InfrastructureShared
-- Name: 627870d85690
-- Type: 21

if pehdr.NumberOfSections == 8 and pesecs[1].Name == "CODE" and pesecs[2].Name == "DATA" then
  return mp.INFECTED
end
return mp.CLEAN
