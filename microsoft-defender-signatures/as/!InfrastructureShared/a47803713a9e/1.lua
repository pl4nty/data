-- Threat: !InfrastructureShared
-- Name: a47803713a9e
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
