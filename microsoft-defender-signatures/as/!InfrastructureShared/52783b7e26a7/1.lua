-- Threat: !InfrastructureShared
-- Name: 52783b7e26a7
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
