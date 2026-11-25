-- Threat: !InfrastructureShared
-- Name: 55782339a874
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
