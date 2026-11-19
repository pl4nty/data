-- Threat: !InfrastructureShared
-- Name: 7c7824324e3d
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
