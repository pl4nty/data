-- Threat: !InfrastructureShared
-- Name: 1e78778f56d6
-- Type: 21

if peattributes.isexe == false or peattributes.isdll == false then
  return mp.CLEAN
end
return mp.INFECTED
