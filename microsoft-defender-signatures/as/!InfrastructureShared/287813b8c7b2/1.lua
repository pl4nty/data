-- Threat: !InfrastructureShared
-- Name: 287813b8c7b2
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
