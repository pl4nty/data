-- Threat: !InfrastructureShared
-- Name: 847856bd1d7e
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
