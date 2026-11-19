-- Threat: !InfrastructureShared
-- Name: 11e783756d002
-- Type: 21

if peattributes.isexe == true or peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
