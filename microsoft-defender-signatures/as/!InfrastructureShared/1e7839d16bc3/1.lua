-- Threat: !InfrastructureShared
-- Name: 1e7839d16bc3
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
