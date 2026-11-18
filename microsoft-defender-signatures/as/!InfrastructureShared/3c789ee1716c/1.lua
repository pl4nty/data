-- Threat: !InfrastructureShared
-- Name: 3c789ee1716c
-- Type: 21

if peattributes.isexe == true and pesecs[6].Name == ".htext" then
  return mp.INFECTED
end
return mp.CLEAN
