-- Threat: !InfrastructureShared
-- Name: 3278b2ba163f
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
