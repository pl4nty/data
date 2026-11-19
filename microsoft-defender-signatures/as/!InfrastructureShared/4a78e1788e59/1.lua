-- Threat: !InfrastructureShared
-- Name: 4a78e1788e59
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
