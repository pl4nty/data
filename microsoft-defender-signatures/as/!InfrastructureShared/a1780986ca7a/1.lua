-- Threat: !InfrastructureShared
-- Name: a1780986ca7a
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
