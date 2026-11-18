-- Threat: !InfrastructureShared
-- Name: 4a78b12d0a9c
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
