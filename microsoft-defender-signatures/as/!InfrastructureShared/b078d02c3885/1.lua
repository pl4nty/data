-- Threat: !InfrastructureShared
-- Name: b078d02c3885
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
