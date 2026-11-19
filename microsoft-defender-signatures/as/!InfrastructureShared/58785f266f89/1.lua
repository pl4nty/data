-- Threat: !InfrastructureShared
-- Name: 58785f266f89
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
