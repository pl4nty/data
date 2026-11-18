-- Threat: !InfrastructureShared
-- Name: 4c782d9e849d
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
