-- Threat: !InfrastructureShared
-- Name: 3278aa636819
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
