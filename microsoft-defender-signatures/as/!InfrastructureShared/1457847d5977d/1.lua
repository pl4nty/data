-- Threat: !InfrastructureShared
-- Name: 1457847d5977d
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
