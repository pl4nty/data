-- Threat: !InfrastructureShared
-- Name: 387876a7dc92
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
