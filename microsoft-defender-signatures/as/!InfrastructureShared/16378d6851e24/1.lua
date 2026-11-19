-- Threat: !InfrastructureShared
-- Name: 16378d6851e24
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
