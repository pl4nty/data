-- Threat: !InfrastructureShared
-- Name: 467851c32541
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
