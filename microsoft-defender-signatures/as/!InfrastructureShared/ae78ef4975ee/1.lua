-- Threat: !InfrastructureShared
-- Name: ae78ef4975ee
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
