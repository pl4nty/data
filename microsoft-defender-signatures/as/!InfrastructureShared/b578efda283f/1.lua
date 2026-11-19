-- Threat: !InfrastructureShared
-- Name: b578efda283f
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
