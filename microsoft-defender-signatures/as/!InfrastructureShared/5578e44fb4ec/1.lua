-- Threat: !InfrastructureShared
-- Name: 5578e44fb4ec
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
