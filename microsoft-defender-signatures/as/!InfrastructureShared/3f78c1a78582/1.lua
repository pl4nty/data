-- Threat: !InfrastructureShared
-- Name: 3f78c1a78582
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
