-- Threat: !InfrastructureShared
-- Name: 41787ebae8c1
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
