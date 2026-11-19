-- Threat: !InfrastructureShared
-- Name: 2a786bd7608f
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
