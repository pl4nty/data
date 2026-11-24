-- Threat: !InfrastructureShared
-- Name: 4778aa908caf
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
