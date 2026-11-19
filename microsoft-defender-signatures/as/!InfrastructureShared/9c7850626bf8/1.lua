-- Threat: !InfrastructureShared
-- Name: 9c7850626bf8
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
