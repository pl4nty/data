-- Threat: !InfrastructureShared
-- Name: 35784787e01b
-- Type: 21

if peattributes.isexe == true and pesecs[7].Name == ".boot" and pesecs[7].Characteristics == 1610612832 then
  return mp.INFECTED
end
return mp.CLEAN
