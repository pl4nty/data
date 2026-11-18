-- Threat: !InfrastructureShared
-- Name: 16678152242d1
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
