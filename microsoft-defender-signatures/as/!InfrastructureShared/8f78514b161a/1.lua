-- Threat: !InfrastructureShared
-- Name: 8f78514b161a
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
