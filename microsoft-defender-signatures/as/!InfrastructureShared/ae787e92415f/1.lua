-- Threat: !InfrastructureShared
-- Name: ae787e92415f
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
