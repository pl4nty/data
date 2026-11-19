-- Threat: !InfrastructureShared
-- Name: 517836e268cf
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
