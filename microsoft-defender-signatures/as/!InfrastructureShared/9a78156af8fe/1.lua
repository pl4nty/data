-- Threat: !InfrastructureShared
-- Name: 9a78156af8fe
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
