-- Threat: !InfrastructureShared
-- Name: dd78440638c9
-- Type: 21

if peattributes.isdll or peattributes.isexe then
  return mp.INFECTED
end
return mp.CLEAN
