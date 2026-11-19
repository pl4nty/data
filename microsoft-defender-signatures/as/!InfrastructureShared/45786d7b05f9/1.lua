-- Threat: !InfrastructureShared
-- Name: 45786d7b05f9
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
