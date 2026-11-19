-- Threat: !InfrastructureShared
-- Name: 827881c33387
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
