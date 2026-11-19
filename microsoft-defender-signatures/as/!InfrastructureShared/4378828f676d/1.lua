-- Threat: !InfrastructureShared
-- Name: 4378828f676d
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
