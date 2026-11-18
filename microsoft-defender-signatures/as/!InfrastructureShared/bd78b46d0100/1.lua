-- Threat: !InfrastructureShared
-- Name: bd78b46d0100
-- Type: 21

if peattributes.no_security == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
