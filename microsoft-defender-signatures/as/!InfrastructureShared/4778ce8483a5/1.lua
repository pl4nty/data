-- Threat: !InfrastructureShared
-- Name: 4778ce8483a5
-- Type: 21

if peattributes.isexe and pesecs[1].Name == "   " then
  return mp.INFECTED
end
return mp.CLEAN
