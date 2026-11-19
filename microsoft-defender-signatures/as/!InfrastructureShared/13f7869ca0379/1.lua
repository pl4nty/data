-- Threat: !InfrastructureShared
-- Name: 13f7869ca0379
-- Type: 21

if peattributes.isexe == true or peattributes.msil == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
