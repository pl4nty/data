-- Threat: !InfrastructureShared
-- Name: 5d78ff46a85a
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
