-- Threat: !InfrastructureShared
-- Name: 3a7867e36734
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
