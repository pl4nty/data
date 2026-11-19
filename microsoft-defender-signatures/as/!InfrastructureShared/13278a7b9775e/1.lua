-- Threat: !InfrastructureShared
-- Name: 13278a7b9775e
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
