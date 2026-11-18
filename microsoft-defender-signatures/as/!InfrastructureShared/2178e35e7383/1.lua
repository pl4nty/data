-- Threat: !InfrastructureShared
-- Name: 2178e35e7383
-- Type: 21

if peattributes.isdll == true or peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
