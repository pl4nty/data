-- Threat: !InfrastructureShared
-- Name: de78985bd9a9
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
