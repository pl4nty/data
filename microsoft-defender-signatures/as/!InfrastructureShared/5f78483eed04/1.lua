-- Threat: !InfrastructureShared
-- Name: 5f78483eed04
-- Type: 21

if peattributes.isexe == true and peattributes.hasexports == true and pesecs[3].Name == "hydrated" and pesecs[2].Name == ".managed" and pesecs[3].Characteristics == 3221225600 and mp.getfilesize() >= 6000000 and mp.getfilesize() <= 8000000 then
  return mp.INFECTED
end
return mp.CLEAN
