-- Threat: !InfrastructureShared
-- Name: 82788e8131aa
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
