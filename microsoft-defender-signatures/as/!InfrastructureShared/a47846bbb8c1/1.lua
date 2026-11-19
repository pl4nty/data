-- Threat: !InfrastructureShared
-- Name: a47846bbb8c1
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true then
  return mp.INFECTED
end
return mp.CLEAN
