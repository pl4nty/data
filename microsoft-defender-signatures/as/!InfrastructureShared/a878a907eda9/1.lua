-- Threat: !InfrastructureShared
-- Name: a878a907eda9
-- Type: 21

if peattributes.isexe == true and pesecs[5].Name == "memcpy_" then
  return mp.INFECTED
end
return mp.CLEAN
