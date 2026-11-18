-- Threat: !InfrastructureShared
-- Name: 75785f63e3cd
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
