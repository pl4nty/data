-- Threat: !InfrastructureShared
-- Name: 5d7835de64af
-- Type: 21

if peattributes.isexe or peattributes.isdll then
  return mp.INFECTED
end
return mp.CLEAN
