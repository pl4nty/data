-- Threat: !InfrastructureShared
-- Name: 52787c1c32e9
-- Type: 21

if peattributes.isexe == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
