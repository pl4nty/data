-- Threat: !InfrastructureShared
-- Name: 2178ab49d13e
-- Type: 21

if peattributes.isexe and pesecs[5].Name == ".OBM" then
  return mp.INFECTED
end
return mp.CLEAN
