-- Threat: !InfrastructureShared
-- Name: 26786e661c0f
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
