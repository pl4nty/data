-- Threat: !InfrastructureShared
-- Name: 4a783e5e9d2b
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
