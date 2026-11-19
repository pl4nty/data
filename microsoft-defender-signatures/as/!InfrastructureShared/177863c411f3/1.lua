-- Threat: !InfrastructureShared
-- Name: 177863c411f3
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
