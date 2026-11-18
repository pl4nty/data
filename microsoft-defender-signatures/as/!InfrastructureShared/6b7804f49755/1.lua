-- Threat: !InfrastructureShared
-- Name: 6b7804f49755
-- Type: 21

if peattributes.isexe == true and pesecs[1].Name == ".nsp0" and pesecs[2].Name == ".nsp1" then
  return mp.INFECTED
end
return mp.CLEAN
