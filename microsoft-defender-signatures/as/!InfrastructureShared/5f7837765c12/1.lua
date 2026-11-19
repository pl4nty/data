-- Threat: !InfrastructureShared
-- Name: 5f7837765c12
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
