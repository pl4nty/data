-- Threat: !InfrastructureShared
-- Name: 4c783412be01
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
