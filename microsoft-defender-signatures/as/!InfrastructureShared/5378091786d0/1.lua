-- Threat: !InfrastructureShared
-- Name: 5378091786d0
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
