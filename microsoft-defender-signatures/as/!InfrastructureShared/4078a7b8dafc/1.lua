-- Threat: !InfrastructureShared
-- Name: 4078a7b8dafc
-- Type: 21

if peattributes.isexe and pesecs[1].Name == "   " then
  return mp.INFECTED
end
return mp.CLEAN
