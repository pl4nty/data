-- Threat: !InfrastructureShared
-- Name: 3d78caca6db8
-- Type: 21

if peattributes.isexe == true and pesecs[7].Name == ".boot" and pesecs[6].Name == ".themida" and pesecs[7].Characteristics == 1610612832 then
  return mp.INFECTED
end
return mp.CLEAN
