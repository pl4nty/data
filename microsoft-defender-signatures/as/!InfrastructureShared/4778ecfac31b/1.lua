-- Threat: !InfrastructureShared
-- Name: 4778ecfac31b
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
