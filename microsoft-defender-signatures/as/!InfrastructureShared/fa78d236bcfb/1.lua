-- Threat: !InfrastructureShared
-- Name: fa78d236bcfb
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
