-- Threat: !InfrastructureShared
-- Name: d5787b935193
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
