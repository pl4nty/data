-- Threat: !InfrastructureShared
-- Name: 2778238381f3
-- Type: 21

if peattributes.no_security == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
