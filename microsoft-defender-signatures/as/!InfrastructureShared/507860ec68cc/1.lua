-- Threat: !InfrastructureShared
-- Name: 507860ec68cc
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
