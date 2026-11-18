-- Threat: !InfrastructureShared
-- Name: 3b780494aafc
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
