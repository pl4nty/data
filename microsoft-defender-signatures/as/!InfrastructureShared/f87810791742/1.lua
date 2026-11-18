-- Threat: !InfrastructureShared
-- Name: f87810791742
-- Type: 21

if peattributes.isexe == true and pehdr.NumberOfSections == 5 and pesecs[5].Name == ".extra" then
  return mp.INFECTED
end
return mp.CLEAN
