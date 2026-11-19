-- Threat: !InfrastructureShared
-- Name: 37786f76ed76
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
