-- Threat: !InfrastructureShared
-- Name: 4378a76c6c36
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
