-- Threat: !InfrastructureShared
-- Name: 40789fafa79f
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
