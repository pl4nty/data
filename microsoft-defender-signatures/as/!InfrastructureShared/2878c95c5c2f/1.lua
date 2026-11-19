-- Threat: !InfrastructureShared
-- Name: 2878c95c5c2f
-- Type: 21

if peattributes.no_security and (peattributes.isexe or peattributes.isdll) then
  return mp.INFECTED
end
return mp.CLEAN
