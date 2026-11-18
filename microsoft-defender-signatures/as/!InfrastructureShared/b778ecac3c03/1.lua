-- Threat: !InfrastructureShared
-- Name: b778ecac3c03
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
