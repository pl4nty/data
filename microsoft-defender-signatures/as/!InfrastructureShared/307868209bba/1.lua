-- Threat: !InfrastructureShared
-- Name: 307868209bba
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
