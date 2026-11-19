-- Threat: !InfrastructureShared
-- Name: 6b78dc00d531
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
