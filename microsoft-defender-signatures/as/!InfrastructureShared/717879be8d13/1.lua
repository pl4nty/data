-- Threat: !InfrastructureShared
-- Name: 717879be8d13
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
