-- Threat: !InfrastructureShared
-- Name: 657836b4682a
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
