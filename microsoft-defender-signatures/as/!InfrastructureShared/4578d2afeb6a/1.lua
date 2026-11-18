-- Threat: !InfrastructureShared
-- Name: 4578d2afeb6a
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
